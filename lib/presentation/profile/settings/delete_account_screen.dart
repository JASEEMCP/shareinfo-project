import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/presentation/profile/widget/delete_pop_up_alert.dart';
import 'package:shareinfo/presentation/profile/widget/radio_tile_widget.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

// Deleting account data
DeleteAccountModel deleteModel = DeleteAccountModel();

class ScreenDeleteAccount extends StatelessWidget {
  ScreenDeleteAccount({super.key});

  final deleteReason = [
    'I am no longer using my account',
    'Due to spam calls or messages',
    'ShareInfo is too expensive',
    'I want to change my phone number',
    'I don’t understand how to use',
    'Facing Privacy Issue',
    'Other',
  ];
  final _textController = generateTextController();
  final _passwordController = generateTextController();
  final ValueNotifier visibilityNotifier = ValueNotifier(true);
  final ValueNotifier enableTextFieldNotifier = ValueNotifier(false);
  final ValueNotifier<String?> _selectItemNotifier = ValueNotifier(null);
  final _passwordFormKey = generateFormKey();
  final _reasonFormKey = generateFormKey();

  @override
  Widget build(BuildContext context) {
    String reason = '';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text(
                  'Delete ShareInfo Account ?',
                  textAlign: TextAlign.left,
                  style: $style.text.textBold16.copyWith(
                    color: context.theme.imiotDarkPurple,
                  ),
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text(
                  'We’re really sorry to see you go ! You will lose all completed Profile Data, also all your job applications and subscriptions..!',
                  textAlign: TextAlign.left,
                  style: $style.text.textSBold14.copyWith(
                    color: context.theme.imiotDarkPurple,
                  ),
                ),
              ),
            ],
          ),
          const Gap(10),
          ValueListenableBuilder(
            valueListenable: visibilityNotifier,
            builder: (context, isVisible, _) {
              return Form(
                key: _passwordFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: $style.insets.sm,
                  ),
                  child: CustomTextFieldWidget(
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
                    controller: _passwordController,
                    validate: true,
                    label: 'Current Password',
                    hintText: "Enter your current Password here !",
                  ),
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _selectItemNotifier,
            builder: (context, value, _) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: deleteReason.length,
                itemBuilder: ((context, index) {
                  return Opacity(
                    opacity: 0.8,
                    child: CustomRadioTileWidget(
                      title: deleteReason[index],
                      padding: const EdgeInsets.only(left: 10),
                      affinity: ListTileControlAffinity.leading,
                      onChanged: (_) {
                        reason = deleteReason[index];
                        if (deleteReason[index] == 'Other') {
                          _selectItemNotifier.value = deleteReason[index];
                          enableTextFieldNotifier.value = true;
                        } else {
                          enableTextFieldNotifier.value = false;
                          _selectItemNotifier.value = deleteReason[index];
                        }
                      },
                      value: value,
                    ),
                  );
                }),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: enableTextFieldNotifier,
            builder: (context, isEnable, _) {
              return Form(
                key: _reasonFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MultiLineTextField(
                    validate: true,
                    enable: isEnable,
                    label: "Let us know as Detailed",
                    maxLine: 7,
                    hintText: "Brief Your Explanation here!",
                    controller: _textController,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: Builder(
          builder: (context) {
            return CustomElevatedButton(
              buttonName: "Delete Account",
              width: ElevatedButtonWidth.large,
              backgroundColor: context.theme.shareinfoRed,
              onPressed: () {
                if (_passwordFormKey.currentState!.validate()) {
                  if (reason == 'Other') {
                    deleteModel = DeleteAccountModel(
                      reason: _textController.text,
                      password: _passwordController.text,
                      refreshToken: auth.authInfo.value.refreshToken,
                    );
                    if (_reasonFormKey.currentState!.validate()) {
                      showDeleteAccountDialog(context);
                    }
                  } else {
                    if (reason.isNotEmpty) {
                      deleteModel = DeleteAccountModel(
                        reason: reason,
                        password: _passwordController.text,
                        refreshToken: auth.authInfo.value.refreshToken,
                      );
                      showDeleteAccountDialog(context);
                    }
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}
