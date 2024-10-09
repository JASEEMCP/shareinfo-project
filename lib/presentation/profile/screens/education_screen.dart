import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/education_model/education_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_search_field.dart';
import 'package:shareinfo/presentation/widget/drop_down_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/upload_document_widget.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenEducation extends StatefulWidget {
  const ScreenEducation({super.key, this.id});
  final int? id;

  @override
  State<ScreenEducation> createState() => _ScreenEducationState();
}

class _ScreenEducationState extends State<ScreenEducation> {
  final _formKey = generateFormKey();
  final _textController = List.generate(8, (index) => generateTextController());
  //This will used to disable gpa field when user is not select scale
  final ValueNotifier<String?> scaleNotifier = ValueNotifier(null);
  //This is used to enable and disable subtitle
  final ValueNotifier<bool> statusVisibilityNotifier = ValueNotifier(false);

  EducationModel model = EducationModel();

  Uint8List? mediaFile;

  bool isEdited = false;

  late StreamSubscription filePickerSubscription;

  @override
  void initState() {
    filePickerSubscription = context.read<FilePickerCubit>().stream.listen(
      (state) {
        if (state.isEdited) {
          isEdited = true;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _textController.clear();
    scaleNotifier.dispose();
    statusVisibilityNotifier.dispose();
    filePickerSubscription.cancel();
    getIt<EducationCubit>().clearData();
    getIt<FilePickerCubit>().removeFile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? mediaName;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //redirecting separate screen with respect to [id]
        if (widget.id != null) {
          context.read<EducationCubit>().retrieveEducationInfo(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess = context.watch<EducationCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "Education",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context
                      .read<EducationCubit>()
                      .deleteEducationInfo(model.media);
                },
              );
            },
          );
        }),
      ),
      body: Padding(
        padding: customPaddingBottom(),
        child: BlocConsumer<EducationCubit, EducationState>(
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
                            .read<EducationCubit>()
                            .retrieveEducationInfo(widget.id!);
                      }
                    : null,
              );
            }
            model = state.userModel;

            _textController[0].text = model.course ?? '';
            _textController[1].text = model.institute ?? '';
            _textController[2].text = handleDoubleNullString(model.gpa);
            _textController[3].text = model.description ?? '';
            _textController[4].text = handleIntegerNullString(model.scale);
            _textController[5].text = model.educationalAttainment?.trim() ?? '';

            _textController[6].text = convertDate(model.startDate) ?? '';
            _textController[7].text = convertDate(model.endDate) ?? '';

            statusVisibilityNotifier.value = model.currentlyStudying ?? false;
            scaleNotifier.value = handleIntegerNullString(model.scale);

            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomDropDownSearch(
                    validate: true,
                    enableController: false,
                    menuController: _textController[5],
                    label: 'Educational Attainment',
                    hintText: 'Select Educational Attainment from here...',
                    onSelect: (value) {
                      _textController[5].text = value?.label ?? '';
                    },
                    menu: [
                      MenuItem(0, 'High School'),
                      MenuItem(0, 'Diploma'),
                      MenuItem(0, 'Bachelor'),
                      MenuItem(0, 'Master'),
                      MenuItem(0, 'Doctorate'),
                    ],
                  ),
                  Gap($style.insets.md),
                  CustomTextFieldWidget(
                    validate: true,
                    controller: _textController[0],
                    label: 'Course',
                    hintText: 'Enter the Course here..',
                  ),
                  CustomTextFieldWidget(
                    validate: true,
                    controller: _textController[1],
                    label: 'Institute Name',
                    hintText: 'Enter the Institute Name here',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextFieldWidget(
                          inputFormatter: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          controller: _textController[6],
                          bottomPadding: 0,
                          label: 'From',
                          hintText: 'DD/MM/YYYY',
                          validate: true,
                          validator: (_) => validateDateFormat(
                              _textController[6].text.trim()),
                          suffix: IconButton(
                            onPressed: () async {
                              final startDate = await selectDate(
                                context,
                                initialDate: DateTime.now(),
                                lastDate: DateTime.now(),
                                firstDate: DateTime(1970, 01, 01),
                              );
                              if (startDate == null) return;
                              _textController[6].text = convertDate(
                                    '${startDate.year}-${startDate.month}-${startDate.day}'
                                        .trim(),
                                  ) ??
                                  '';
                              model.startDate =
                                  '${startDate.year}-${startDate.month}-${startDate.day}';
                            },
                            icon: const Icon(Icons.calendar_month_outlined),
                          ),
                        ),
                      ),
                      Gap($style.insets.sm),
                      ValueListenableBuilder(
                        valueListenable: statusVisibilityNotifier,
                        builder: (context, enabled, _) {
                          return Expanded(
                            child: CustomTextFieldWidget(
                              enabled: !enabled,
                              inputFormatter: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              bottomPadding: 0,
                              controller: _textController[7],
                              label: 'To',
                              hintText: 'DD/MM/YYYY',
                              validate: true,
                              validator: (_) => enabled
                                  ? null
                                  : validateDateFormat(
                                      _textController[7].text.trim(),
                                    ),
                              suffix: IconButton(
                                onPressed: () async {
                                  final endDate = await selectDate(
                                    context,
                                    initialDate: DateTime.now(),
                                    lastDate: DateTime.now(),
                                    firstDate:
                                        convertToDateTime(model.startDate) ??
                                            DateTime(1970, 01, 01),
                                  );
                                  if (endDate == null) return;
                                  _textController[7].text = convertDate(
                                          '${endDate.year}-${endDate.month}-${endDate.day}'
                                              .trim()) ??
                                      '';
                                  model.endDate =
                                      '${endDate.year}-${endDate.month}-${endDate.day}';
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  StatusCheckBoxWidget(
                    onChanged: (val) {
                      //clear already picked date
                      model.endDate = null;
                      _textController[7].clear();
                      statusVisibilityNotifier.value = val ?? false;
                    },
                    statusVisibilityNotifier: statusVisibilityNotifier,
                    statusText: "I Currently Studying",
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextFieldWidget(
                          maxLine: 1,
                          onChanged: (value) {
                            scaleNotifier.value = value;
                          },
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'This field is Required';
                            } else if (!isDouble(value.trim())) {
                              return 'Enter valid GPA Scale';
                            }
                            return null;
                          },
                          validate: true,
                          controller: _textController[4],
                          keyboardType: TextInputType.number,
                          label: 'GPA Scale',
                          hintText: 'Enter a GPA Scale',
                        ),
                      ),
                      Gap($style.insets.sm),
                      ValueListenableBuilder(
                        valueListenable: scaleNotifier,
                        builder: (context, gpaScale, _) {
                          return Expanded(
                            child: CustomTextFieldWidget(
                              maxLine: 1,
                              validator: (value) {
                                try {
                                  if (value!.trim().isEmpty) {
                                    return 'This field is Required';
                                  } else if (!isDouble(value.trim()) ||
                                      double.parse(value.trim()) >
                                          double.parse(
                                              _textController[4].text.trim())) {
                                    return 'Enter valid GPA';
                                  }
                                  return null;
                                } catch (e) {
                                  return 'Enter valid GPA';
                                }
                              },
                              validate: true,
                              controller: _textController[2],
                              enabled: gpaScale?.trim().isNotEmpty,
                              keyboardType: TextInputType.number,
                              label: 'GPA',
                              hintText: 'Enter GPA here',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  MultiLineTextField(
                    controller: _textController[3],
                    label: 'Description (Optional)',
                    hintText:
                        'Enter a brief about the role you were done at the organization through out the duration of your employment..',
                  ),
                  Builder(
                    builder: (context) {
                      final currentState = context.watch<FilePickerCubit>();
                      mediaFile = currentState.fileBytes;
                      mediaName = currentState.fileName;
                      return UploadDocumentWidget(
                        onBrowse: () {
                          context.read<FilePickerCubit>().browseFile();
                        },
                        onRemove: () {
                          context.read<FilePickerCubit>().removeFile();
                        },
                        label: 'Add Media (Optional)',
                        blobDir: BlobDir.education,
                        uploadHintText: 'Browse file',
                        currentState: currentState.state,
                      );
                    },
                  )
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
            final currentState = context.watch<EducationCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      mediaFile ??= getIt<FilePickerCubit>().fileBytes;

                      if (_formKey.currentState!.validate()) {
                        model = model.copyWith(
                          educationalAttainment:
                              handleNullString(_textController[5]),
                          course: handleNullString(_textController[0]),
                          institute: handleNullString(_textController[1]),
                          gpa: stringToDouble(_textController[2].text),
                          description: handleNullString(_textController[3]),
                          currentlyStudying: statusVisibilityNotifier.value,
                          scale: stringToInt(_textController[4].text),
                          startDate: convertDate(
                            _textController[6].text,
                            toReverse: true,
                          ),
                          endDate: convertDate(
                            _textController[7].text,
                            toReverse: true,
                          ),
                        );

                        context.read<EducationCubit>().saveEducationInfo(
                              model,
                              mediaFile,
                              requestTypeHandleWithId(widget.id),
                              mediaName,
                              isEdited: isEdited,
                            );
                        isEdited = false;
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
