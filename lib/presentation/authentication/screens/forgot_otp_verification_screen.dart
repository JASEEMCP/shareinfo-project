import 'package:flutter/gestures.dart';
import 'package:shareinfo/application/auth/forgot_pwd_cubit/forgot_pwd_cubit.dart';
import 'package:shareinfo/application/auth/resend_otp_cubit/resend_otp_cubit.dart';
import 'package:shareinfo/core/platform_info.dart';
import 'package:shareinfo/presentation/authentication/screens/email_verify_screen.dart';
import 'package:shareinfo/presentation/authentication/widget/custom_otp_square_box.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenOTPVerification extends StatefulWidget {
  const ScreenOTPVerification({super.key, required this.email});

  ///Get email form contact verify screen
  final String email;

  @override
  State<ScreenOTPVerification> createState() => _ScreenOTPVerificationState();
}

class _ScreenOTPVerificationState extends State<ScreenOTPVerification> {
  final List<TextEditingController> otpControllerList =
      List.generate(4, (index) => generateTextController());

  @override
  void initState() {
    super.initState();
    for (var controller in otpControllerList) {
      controller.addListener(_onTextChanged);
    }
  }

  void _onTextChanged() {
    if (otpControllerList.every((controller) => controller.text.length == 1)) {
      if (!_isSubmitted) {
        _submit();
      }
    } else {
      _isSubmitted = false; // Reset the flag if conditions are not met
    }
  }

  @override
  void dispose() {
    for (var controller in otpControllerList) {
      controller.removeListener(_onTextChanged);
      controller.dispose();
    }
    super.dispose();
  }

  bool _isSubmitted = false;
  void _submit() async {
    _isSubmitted = true;

    if (otpControllerList.isAnyOneEmpty()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(showSnackBar('Enter OTP sent to your email address'));
      return;
    }
    await context.read<ForgotPwdCubit>().verifyOtp(
          widget.email,
          otpControllerList.joinTextController(),
          PwdType.verifyOtp,
        );
  }

  final GlobalKey _toolTipKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ResendOtpCubit>().startTimer(60);
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffFBFBFB),
      appBar: buildCustomAppBar(
        context,
        title: "Verify E-Mail Account",
        enableSuffixIcon: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Gap(inset.offset),
              if (PlatformInfo.isDesktopOrWeb)
                Semantics(
                  image: true,
                  readOnly: true,
                  label: 'Animated image',
                  child: Image.asset(
                    'assets/icons/password-entry.png',
                    height: 120,
                    width: 150,
                  ),
                ),
              if (PlatformInfo.isMobile)
                Semantics(
                  image: true,
                  readOnly: true,
                  label: 'Animated image',
                  child: Image.asset(
                    'assets/gif/verification_gif.gif',
                    height: 270,
                  ),
                ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "OTP has been sent to\n",
                      style: $style.text.textSBold14.copyWith(
                        color: context.theme.shareinfoGrey,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    TextSpan(
                      text: tempEmail,
                      style: $style.text.textBold14.copyWith(
                        color: context.theme.shareinfoBlue,
                        fontFamily: 'Nunito',
                      ),
                    )
                  ],
                ),
              ),
              Gap(inset.sm),
              Semantics(
                textField: true,
                label: 'Otp field',
                child: SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpInput(otpControllerList[0], true),
                      OtpInput(otpControllerList[1], false),
                      OtpInput(otpControllerList[2], false),
                      OtpInput(otpControllerList[3], false),
                    ],
                  ),
                ),
              ),
              Gap(inset.md),
              Semantics(
                button: true,
                label: 'Navigate into next page',
                child: BlocConsumer<ForgotPwdCubit, ForgotPwdState>(
                  listener: (context, state) {
                    final type = context.read<ForgotPwdCubit>().pwdType;
                    state.maybeWhen(
                      otpVerifySuccess: () {
                        if (type == PwdType.verifyOtp) {
                          context.go(
                            ScreenPath.confirmationPassword(),
                            extra: widget.email,
                          );
                        }
                      },
                      orElse: () => null,
                      error: (e) => ScaffoldMessenger.of(context)
                          .showSnackBar(showSnackBar(e.errorDescription)),
                    );
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      isLoading: state.isVerifying,
                      buttonName: 'Verify',
                      width: ElevatedButtonWidth.custom,
                      onPressed: _submit,
                    );
                  },
                ),
              ),
              Gap(inset.md),
              BlocBuilder<ResendOtpCubit, ResendOtpState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => _buildResendOtpText(
                        context, 'Resend OTP', 'Click here'),
                    reSendingOtp: () => _buildResendOtpText(
                        context, 'Resend OTP', 'Sending...'),
                    timerRunning: (t) =>
                        _buildResendOtpText(context, 'Resend in', '$t Sec'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTooltip() {
    final dynamic tooltip = _toolTipKey.currentState;
    tooltip.ensureTooltipVisible();
  }

  Row _buildResendOtpText(BuildContext context, String txt1, String txt2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Tooltip(
          key: _toolTipKey,
          textAlign: TextAlign.center,
          message:
              "Please check your spam or junk folder\nif you haven't received the OTP in your inbox.",
          child: IconButton(
            onPressed: () {
              _showTooltip();
            },
            icon: Icon(
              Icons.info,
              color: Colors.black.withOpacity(0.30),
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "$txt1 ",
                style: $style.text.textSBold12.copyWith(
                  color: context.theme.shareinfoGrey,
                  fontFamily: 'Nunito',
                ),
              ),
              TextSpan(
                text: txt2,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => context
                      .read<ResendOtpCubit>()
                      .reSendOtp(60, widget.email),
                style: $style.text.textBold12.copyWith(
                  color: context.theme.shareinfoBlue,
                  fontFamily: 'Nunito',
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
