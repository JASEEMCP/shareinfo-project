import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/profile_model/summary_model.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenSummary extends StatefulWidget {
  const ScreenSummary({super.key});

  @override
  State<ScreenSummary> createState() => _ScreenSummaryState();
}

class _ScreenSummaryState extends State<ScreenSummary> {
  //Form key validator
  final _formKey = generateFormKey();

  //Generating text editing controller
  final _textController = generateTextController();

  ///Summary info model
  SummaryModel model = SummaryModel();

  @override
  void dispose() {
    getIt<PersonalInfoCubit>().clearData();
    _textController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<PersonalInfoCubit>().getSummary();
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) {
            return buildCustomAppBar(
              context,
              title: 'Summary',
              enableSuffixIcon: false,
            );
          },
        ),
      ),
      body: Padding(
        padding: customPaddingBottom(),
        child: BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
          listener: (context, state) {
            //show success message for  user is edited their profile
            if (state.saveSuccess) {
              context.showCustomSnackbarAtTop();
              return;
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const CustomCircularProgressIndicatorC();
            } else if (state.isError) {
              return NetWorkError(
                padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                onRefresh: () {
                  context.read<PersonalInfoCubit>().getSummary();
                },
              );
            }
            //Assign controller values
            model = state.summaryText;
            _textController.text = model.summaryTxt ?? '';
            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  MultiLineTextField(
                    validate: true,
                    controller: _textController,
                    label: "Summary (200 to 600 Characters)",
                    hintText:
                        '''A tech profile summary is a brief description of your qualifications, experience, and accomplishments relevant to the job you are applying for.''',
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: Builder(
          builder: (context) {
            final currentState = context.watch<PersonalInfoCubit>().state;
            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: "Save",
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model.summaryTxt = handleNullString(_textController);
                        context
                            .read<PersonalInfoCubit>()
                            .saveSummaryText(model);
                      }
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
