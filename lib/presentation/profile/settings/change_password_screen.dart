import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenChangePassword extends StatelessWidget {
  ScreenChangePassword({super.key});
  final pwdControllerList =
      List.generate(3, (index) => generateTextController());
  final _formKey = generateFormKey();
  final ValueNotifier<bool> visibilityNotifier = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) {
            return buildCustomAppBar(
              context,
              title: 'Change Password',
              enableSuffixIcon: false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () => null,
                error: (e) => ScaffoldMessenger.of(context).showSnackBar(
                  showSnackBar(e.errorDescription),
                ),
                success: () => context.pop(),
              );
            },
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomTextFieldWidget(
                    controller: pwdControllerList[0],
                    validate: true,
                    label: 'Old Password',
                    hintText: "Enter Your Old Password here !",
                  ),
                  ValueListenableBuilder(
                      valueListenable: visibilityNotifier,
                      builder: (context, isVisible, _) {
                        return CustomTextFieldWidget(
                          validate: true,
                          maxLine: 1,
                          obscure: isVisible,
                          controller: pwdControllerList[1],
                          label: 'New Password',
                          hintText: "Enter Your New Password here !",
                        );
                      }),
                  ValueListenableBuilder(
                    valueListenable: visibilityNotifier,
                    builder: (context, isVisible, _) {
                      return CustomTextFieldWidget(
                        maxLine: 1,
                        obscure: isVisible,
                        suffix: IconButton(
                          onPressed: () {
                            visibilityNotifier.value = !isVisible;
                          },
                          icon: isVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        controller: pwdControllerList[2],
                        label: 'Confirm New Password',
                        hintText: "Confirm Your New Password here !",
                        validate: true,
                        validator: (_) {
                          if ([pwdControllerList[1], pwdControllerList[2]]
                              .isAnyOneEmpty()) {
                            return ''.fieldNotEmpty;
                          } else if (![
                            pwdControllerList[1],
                            pwdControllerList[2]
                          ].allSame()) {
                            return ''.isMismatch;
                          } else if (pwdControllerList.isValidPasswordAt(2)) {
                            return ''.validPassword;
                          } else {
                            return null;
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
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: Builder(builder: (context) {
          final currentState = context.watch<ResetPasswordCubit>().state;
          return CustomElevatedButton(
            isLoading: currentState.isLoading,
            buttonName: "Save",
            width: ElevatedButtonWidth.large,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<ResetPasswordCubit>().resetPassword(
                      pwdControllerList[0].text.trim(),
                      pwdControllerList[1].text.trim(),
                    );
              }
            },
          );
        }),
      ),
    );
  }
}
