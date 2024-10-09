import 'package:shareinfo/application/auth/forgot_pwd_cubit/forgot_pwd_cubit.dart';
import 'package:shareinfo/core/platform_info.dart';
import 'package:shareinfo/presentation/authentication/widget/_auth_textfield_custom.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import '../../widget/snack_bar_custom.dart';
import '../widget/custom_check_box.dart';

//This is Sign up screen of your application
class ScreenPasswordConfirmation extends StatelessWidget {
  ScreenPasswordConfirmation({super.key, required this.email});

  //get email from previous screen for submitting new password
  final String email;

  ///Visibility notifier of password
  final ValueNotifier<bool> visibilityNotifier = ValueNotifier<bool>(true);
  final pwdControllerList =
      List.generate(2, (index) => generateTextController());
  final _formKey = generateFormKey();
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildCustomAppBar(
        context,
        title: "Forgot Password",
        enableSuffixIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: inset.lg,
            right: inset.lg,
          ),
          child: Center(
            child: Column(
              children: [
                if (PlatformInfo.isMobile)
                  Image.asset(
                    "assets/gif/forgot_pwd.gif",
                    height: 250,
                  ),
                if (PlatformInfo.isDesktopOrWeb)
                  Image.asset(
                    "assets/icons/password.png",
                    height: 150,
                    width: 130,
                  ),
                Padding(
                  padding: EdgeInsets.all(inset.sm),
                  child: Text(
                    'Create Your New Password',
                    textScaler: const TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: $style.text.textBold18.copyWith(
                      color: context.theme.shareinfoTextDark,
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: visibilityNotifier,
                  builder: (context, visible, _) {
                    return AuthTextFieldWidget(
                      obscureText: visible,
                      controller: pwdControllerList[0],
                      hintText: 'Enter New Password',
                      prefixIcon: const Icon(Icons.lock),
                    );
                  },
                ),
                Gap(inset.sm),
                Form(
                  key: _formKey,
                  child: ValueListenableBuilder(
                    valueListenable: visibilityNotifier,
                    builder: (context, visible, _) {
                      return AuthTextFieldWidget(
                        obscureText: visible,
                        controller: pwdControllerList[1],
                        hintText: 'Confirm New Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off),
                        onSuffixTap: () => visibilityNotifier.value = !visible,
                        validator: (p0) {
                          if (pwdControllerList.isAnyOneEmpty()) {
                            return ''.fieldNotEmpty;
                          } else if (!pwdControllerList.allSame()) {
                            return ''.isMismatch;
                          } else if (pwdControllerList.isValidPasswordAt(0)) {
                            return ''.validPassword;
                          } else {
                            return null;
                          }
                        },
                      );
                    },
                  ),
                ),
                Gap(inset.sm),
                const CustomCheckbox(),
                Gap(inset.sm),
                BlocConsumer<ForgotPwdCubit, ForgotPwdState>(
                  listener: (context, state) {
                    final type = context.read<ForgotPwdCubit>().pwdType;
                    state.maybeWhen(
                      resetPasswordSuccess: () {
                        if (type == PwdType.resetPwd) {
                          context.go(ScreenPath.login);
                        }
                      },
                      orElse: () => null,
                      error: (e) => ScaffoldMessenger.of(context)
                          .showSnackBar(showSnackBar(e.errorDescription)),
                    );
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      isLoading: state.isResetting,
                      buttonName: 'Continue',
                      backgroundColor: context.theme.shareinfoBlue,
                      width: ElevatedButtonWidth.custom,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ForgotPwdCubit>().resetPassword(
                                email,
                                pwdControllerList[1].text.trim(),
                                PwdType.resetPwd,
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
