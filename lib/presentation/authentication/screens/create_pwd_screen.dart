import 'package:shareinfo/application/auth/login_cubit/login_cubit.dart';
import 'package:shareinfo/core/platform_info.dart';
import 'package:shareinfo/presentation/authentication/widget/_auth_textfield_custom.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import '../widget/custom_check_box.dart';

//This is Sign up screen of your application
class ScreenCreatePassword extends StatelessWidget {
  ScreenCreatePassword({super.key});

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
        title: "Create Password",
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
                    }),
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
                Gap(inset.md),
                const CustomCheckbox(),
                Gap(inset.md),
                BlocConsumer<LoginCubit, LoginState>(
                  listenWhen: (previous, current) =>
                      previous.isCreatingPassword,
                  listener: (context, state) {
                    state.maybeWhen(
                      authorized: () => context.go(ScreenPath.appendWithSignUp),
                      authError: (e) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        showSnackBar(e.errorDescription),
                      ),
                      //Nothing todo
                      orElse: () => null,
                    );
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      isLoading: state.isCreatingPassword,
                      buttonName: 'Continue',
                      backgroundColor: context.theme.shareinfoBlue,
                      width: ElevatedButtonWidth.custom,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<LoginCubit>()
                              .createPassword(pwdControllerList[1].text.trim());
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
