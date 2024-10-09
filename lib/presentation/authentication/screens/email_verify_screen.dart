import 'package:shareinfo/core/platform_info.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/application/auth/forgot_pwd_cubit/forgot_pwd_cubit.dart';
import 'package:shareinfo/presentation/authentication/widget/_auth_textfield_custom.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';

String tempEmail = "";

class ScreenContactVerification extends StatelessWidget {
  ScreenContactVerification({super.key});
  final TextEditingController txtController = TextEditingController();

  final _formKey = generateFormKey();
  final _emailController = generateTextController();

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffFBFBFB),
      appBar: buildCustomAppBar(
        context,
        title: "Verify E-Mail",
        enableSuffixIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: kTextTabBarHeight),
          child: Center(
            child: Column(
              children: [
                if (PlatformInfo.isDesktopOrWeb)
                  Semantics(
                    image: true,
                    readOnly: true,
                    label: 'Animated image',
                    child: Image.asset(
                      'assets/icons/password.png',
                      height: 150,
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
                Gap(inset.sm),
                Semantics(
                  textField: true,
                  label: 'Email field',
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: inset.md),
                      child: AuthTextFieldWidget(
                        controller: _emailController,
                        hintText: 'Enter your Email here',
                        prefixIcon: const Icon(Icons.email),
                        validator: (email) {
                          if ([_emailController].isAnyOneEmpty()) {
                            return ''.emailNotEmpty;
                          } else if ([_emailController].isValidEmailAt(0)) {
                            return 'Enter valid email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Gap(inset.md),
                Semantics(
                  button: true,
                  label: 'Button to navigate email verification screen',
                  child: BlocConsumer<ForgotPwdCubit, ForgotPwdState>(
                    listener: (context, state) {
                      final type = context.read<ForgotPwdCubit>().pwdType;
                      state.maybeWhen(
                        otpSuccess: () {
                          tempEmail = _emailController.text.trim();
                          if (type == PwdType.sendOtp) {
                            context.push(ScreenPath.verifyOtp(),
                                extra: _emailController.text.trim());
                          }
                        },
                        orElse: () => null,
                        error: (e) => ScaffoldMessenger.of(context)
                            .showSnackBar(showSnackBar(e.errorDescription)),
                      );
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        isLoading: state.isSending,
                        buttonName: 'Verify',
                        width: ElevatedButtonWidth.custom,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await context.read<ForgotPwdCubit>().sendOtp(
                                  _emailController.text.trim(),
                                  PwdType.sendOtp,
                                );
                          }
                        },
                      );
                    },
                  ),
                ),
                Gap(inset.md),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: inset.offset),
                  child: Text(
                    "we will send a verification code into the Email",
                    textAlign: TextAlign.center,
                    style: $style.text.textSBold12.copyWith(
                      color: context.theme.shareinfoGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
