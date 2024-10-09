import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/seminar_training_model/seminar_training_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenSeminarAndTraining extends StatefulWidget {
  const ScreenSeminarAndTraining({super.key, this.id});

  final int? id;

  @override
  State<ScreenSeminarAndTraining> createState() =>
      _ScreenSeminarAndTrainingState();
}

class _ScreenSeminarAndTrainingState extends State<ScreenSeminarAndTraining> {
  final _formKey = generateFormKey();
  final _textController = List.generate(4, (index) => generateTextController());
  SeminarTrainingModel model = SeminarTrainingModel();

  @override
  void dispose() {
    _textController.clear();
    getIt<SeminarTrainingCubit>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //redirecting separate screen with respect to [id]
        if (widget.id != null) {
          context.read<SeminarTrainingCubit>().getSeminarTraining(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess =
              context.watch<SeminarTrainingCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "Seminars & Trainings",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context
                      .read<SeminarTrainingCubit>()
                      .deleteSeminarTrainingInfo();
                },
              );
            },
          );
        }),
      ),
      body: Padding(
        padding: customPaddingBottom(),
        child: SafeArea(
          child: BlocConsumer<SeminarTrainingCubit, SeminarTrainingState>(
            listener: (context, state) {
              //show success message for  user is edited their profile
              if (widget.id != null && state.saveSuccess) {
                context.showCustomSnackbarAtTop();
                return;
                //navigate profile page user is add new profile row
              } else if (widget.id == null && state.saveSuccess) {
                return context.pop();
              } else {
                //navigate profile page if user is delete a row
                if (state.deleteSuccess) return context.pop();
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const CustomCircularProgressIndicatorC();
              } else if (state.isError) {
                return NetWorkError(
                  padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                  onRefresh: widget.id != null
                      ? () {
                          context
                              .read<SeminarTrainingCubit>()
                              .getSeminarTraining(widget.id!);
                        }
                      : null,
                );
              }
              model = state.userModel;
              _textController[0].text = model.title ?? '';
              _textController[1].text = model.organisation ?? '';
              _textController[2].text = model.description ?? '';
              _textController[3].text = convertDate(model.date) ?? '';

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      controller: _textController[0],
                      validate: true,
                      label: 'Topic',
                      hintText: 'Enter your Topic',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[1],
                      validate: true,
                      label: 'Organizer',
                      hintText: 'Enter Organizer name',
                    ),
                    CustomTextFieldWidget(
                      inputFormatter: [LengthLimitingTextInputFormatter(10)],
                      controller: _textController[3],
                      label: 'Conducted On',
                      hintText: 'DD/MM/YYYY',
                      validate: true,
                      validator: (_) =>
                          validateDateFormat(_textController[3].text.trim()),
                      suffix: IconButton(
                        onPressed: () async {
                          final startDate = await selectDate(
                            context,
                            initialDate: DateTime.now(),
                            lastDate: DateTime.now(),
                            firstDate: DateTime(1970, 01, 01),
                          );
                          if (startDate == null) return;
                          _textController[3].text = convertDate(
                                '${startDate.year}-${startDate.month}-${startDate.day}'
                                    .trim(),
                              ) ??
                              '';
                          model.date =
                              '${startDate.year}-${startDate.month}-${startDate.day}';
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                    Gap($style.insets.lg),
                    MultiLineTextField(
                      controller: _textController[2],
                      label: 'Description (Optional)',
                      hintText:
                          'Enter a brief about the role you were done at the organization through out the duration of your employment..',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: Builder(
          builder: (context) {
            final currentState = context.watch<SeminarTrainingCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model = model.copyWith(
                          title: handleEmptyString(_textController[0]),
                          organisation: handleNullString(_textController[1]),
                          description: handleNullString(_textController[2]),
                          date: convertDate(
                            _textController[3].text,
                            toReverse: true,
                          ),
                        );
                        context
                            .read<SeminarTrainingCubit>()
                            .saveSeminarTraining(
                              model,
                              requestTypeHandleWithId(widget.id),
                            );
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
