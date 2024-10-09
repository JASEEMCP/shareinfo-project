import 'package:shareinfo/application/settings/deactivate_account/deactivate_account_cubit.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';

class ScreenDetectiveSubmission extends StatefulWidget {
  const ScreenDetectiveSubmission({super.key});

  @override
  State<ScreenDetectiveSubmission> createState() =>
      _ScreenDetectiveSubmissionState();
}

class _ScreenDetectiveSubmissionState extends State<ScreenDetectiveSubmission> {
  final _textController = generateTextController();

  final _passwordController = generateTextController();

  final _formKey = generateFormKey();

  final ValueNotifier visibilityNotifier = ValueNotifier(true);

  @override
  void dispose() {
    super.dispose();
    _textController.clear();
    _passwordController.clear();
    visibilityNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {},
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text(
              'Let us Know!',
              textAlign: TextAlign.center,
              style: $style.text.textBold26.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
            const Gap(10),
            Text(
              'Let us know, Why You were decided to\nDeactivate ShareInfo Account !',
              textAlign: TextAlign.center,
              style: $style.text.textSBold12.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ValueListenableBuilder(
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
                    controller: _passwordController,
                    validate: true,
                    label: 'Current Password',
                    hintText: "Enter your current Password here !",
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MultiLineTextField(
                validate: true,
                label: "Reason",
                maxLine: 15,
                hintText: "Brief Your Reason Behind this Decision !",
                controller: _textController,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: BlocConsumer<DeactivateAccountCubit, DeactivateAccountState>(
          listener: (context, state) {
            if (state.isSubmitted) {
              ///Navigating into login screen user is deactivate their account

              return context.go(ScreenPath.login);
            }
            if (state.isError) {
              ScaffoldMessenger.of(context).showSnackBar(
                showSnackBar(
                  state.maybeWhen(
                    orElse: () => 'Something went Wrong',
                    submissionError: (e) => e.errorDescription,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            return CustomElevatedButton(
              buttonName: "Submit",
              isLoading: state.isSubmitting,
              width: ElevatedButtonWidth.large,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final model = SubmissionData(
                    reason: _textController.text,
                    password: _passwordController.text.trim(),
                  );
                  context
                      .read<DeactivateAccountCubit>()
                      .deactivateAccount(model);
                }
              },
              backgroundColor: context.theme.shareinfoOrange,
            );
          },
        ),
      ),
    );
  }
}
