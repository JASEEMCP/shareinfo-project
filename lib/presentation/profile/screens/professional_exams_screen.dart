import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/professional_exam_model/professional_exam_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenProfessionalsExams extends StatefulWidget {
  const ScreenProfessionalsExams({super.key, this.id});

  final int? id;

  @override
  State<ScreenProfessionalsExams> createState() =>
      _ScreenProfessionalsExamsState();
}

class _ScreenProfessionalsExamsState extends State<ScreenProfessionalsExams> {
  final _formKey = generateFormKey();
  final _textController = List.generate(5, (index) => generateTextController());
  ProfessionalExamModel model = ProfessionalExamModel();
  final ValueNotifier<String?> scaleNotifier = ValueNotifier(null);

  @override
  void dispose() {
    _textController.clear();
    getIt<ProfessionalExamCubit>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //redirecting separate screen with respect to [id]
        if (widget.id != null) {
          context.read<ProfessionalExamCubit>().getProfessionalExam(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess =
              context.watch<ProfessionalExamCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "Professionals Exams",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context
                      .read<ProfessionalExamCubit>()
                      .deleteProfessionalExam();
                },
              );
            },
          );
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<ProfessionalExamCubit, ProfessionalExamState>(
            listener: (context, state) {
              //show  message user is edited their profile
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
                              .read<ProfessionalExamCubit>()
                              .getProfessionalExam(widget.id!);
                        }
                      : null,
                );
              }
              model = state.userModel;

              _textController[0].text = model.title ?? '';
              _textController[1].text = handleDoubleNullString(model.score);
              _textController[2].text = handleIntegerNullString(model.scale);
              _textController[3].text = model.description ?? '';
              _textController[4].text = convertDate(model.dateOfIssue) ?? '';

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[0],
                      label: 'Title',
                      hintText: 'Title of Exam',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: CustomTextFieldWidget(
                            validate: true,
                            onChanged: (value) {
                              scaleNotifier.value = value;
                            },
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'This field is Required';
                              } else if (!isDouble(value.trim())) {
                                return 'Enter valid Score scale';
                              }
                              return null;
                            },
                            maxLine: 1,
                            controller: _textController[2],
                            keyboardType: TextInputType.number,
                            label: "Score Scale",
                            hintText: "Enter the Score Scale",
                          ),
                        ),
                        const Spacer(),
                        ValueListenableBuilder(
                            valueListenable: scaleNotifier,
                            builder: (context, scoreScale, _) {
                              return Expanded(
                                flex: 6,
                                child: CustomTextFieldWidget(
                                  validate: true,
                                  validator: (value) {
                                    try {
                                      if (value!.trim().isEmpty) {
                                        return 'This field is Required';
                                      } else if (!isDouble(value.trim()) ||
                                          double.parse(value.trim()) >
                                              double.parse(_textController[2]
                                                  .text
                                                  .trim())) {
                                        return 'Enter valid GPA scale';
                                      }
                                      return null;
                                    } catch (e) {
                                      return 'Enter valid GPA scale';
                                    }
                                  },
                                  controller: _textController[1],
                                  maxLine: 1,
                                  keyboardType: TextInputType.number,
                                  enabled: scoreScale?.trim().isNotEmpty,
                                  label: "Score",
                                  hintText: "Enter the Score Gained",
                                ),
                              );
                            }),
                      ],
                    ),
                    CustomTextFieldWidget(
                      inputFormatter: [LengthLimitingTextInputFormatter(10)],
                      controller: _textController[4],
                      label: 'Qualified On',
                      hintText: 'DD/MM/YYYY',
                      validate: true,
                      validator: (_) =>
                          validateDateFormat(_textController[4].text.trim()),
                      suffix: IconButton(
                        onPressed: () async {
                          final startDate = await selectDate(
                            context,
                            initialDate: DateTime.now(),
                            lastDate: DateTime.now(),
                            firstDate: DateTime(1970, 01, 01),
                          );
                          if (startDate == null) return;
                          _textController[4].text = convertDate(
                                '${startDate.year}-${startDate.month}-${startDate.day}'
                                    .trim(),
                              ) ??
                              '';
                          model.dateOfIssue =
                              '${startDate.year}-${startDate.month}-${startDate.day}';
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                    Gap($style.insets.lg),
                    MultiLineTextField(
                      controller: _textController[3],
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
            final currentState = context.watch<ProfessionalExamCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model = model.copyWith(
                          title: handleEmptyString(
                            _textController[0],
                            toUpper: true,
                          ),
                          score: stringToDouble(_textController[1].text),
                          scale: stringToInt(_textController[2].text),
                          description: handleNullString(_textController[3]),
                          dateOfIssue: convertDate(
                            _textController[4].text,
                            toReverse: true,
                          ),
                        );

                        context
                            .read<ProfessionalExamCubit>()
                            .saveProfessionalExam(
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
