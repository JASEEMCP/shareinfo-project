import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/project_model/project_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/upload_document_widget.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenProject extends StatefulWidget {
  const ScreenProject({super.key, this.id});
  final int? id;

  @override
  State<ScreenProject> createState() => _ScreenProjectState();
}

class _ScreenProjectState extends State<ScreenProject> {
  final _formKey = generateFormKey();
  //This is used to enable and disable subtitle
  final ValueNotifier<bool> statusVisibilityNotifier = ValueNotifier(false);
  final _textController = List.generate(8, (index) => generateTextController());
  ProjectModel model = ProjectModel();
  Uint8List? mediaFile;

  late StreamSubscription filePickerSubscription;
  bool isEdited = true;
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
    statusVisibilityNotifier.dispose();
    filePickerSubscription.cancel();
    getIt<FilePickerCubit>().removeFile();
    getIt<ProjectCubit>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? mediaName;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //redirecting separate screen with respect to [id]
        if (widget.id != null) {
          context.read<ProjectCubit>().retrieveProjectInfo(widget.id!);
        } else {}
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess = context.watch<ProjectCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "Projects",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context
                      .read<ProjectCubit>()
                      .deleteProjectInfo(model.media);
                },
              );
            },
          );
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<ProjectCubit, ProjectState>(
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
                              .read<ProjectCubit>()
                              .retrieveProjectInfo(widget.id!);
                        }
                      : null,
                );
              }
              model = state.userModel;
              _textController[0].text = model.programName ?? '';
              _textController[1].text = model.role ?? '';
              // _textController[2].text = '';
              _textController[3].text = model.description ?? '';
              _textController[4].text = model.projectUrl ?? '';
              _textController[5].text = model.referenceUrl ?? '';
              _textController[6].text = convertDate(model.startDate) ?? '';
              _textController[7].text = convertDate(model.endDate) ?? '';
              statusVisibilityNotifier.value =
                  model.currentlyDeveloping ?? false;

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      controller: _textController[0],
                      validate: true,
                      label: 'Project Name',
                      hintText: 'Enter the Project Name here... ',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[1],
                      validate: true,
                      label: 'Role',
                      hintText: 'Enter Your Role',
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
                                controller: _textController[7],
                                label: 'To',
                                hintText: 'DD/MM/YYYY',
                                bottomPadding: 0,
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
                                  icon:
                                      const Icon(Icons.calendar_month_outlined),
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
                      statusText: "on-going project",
                    ),
                    MultiLineTextField(
                      controller: _textController[3],
                      label: 'Description (Optional)',
                      hintText:
                          'Enter a brief about the role you were done at the organization through out the duration of your employment....',
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
                          currentState: currentState.state,
                          label: 'Add Media',
                          blobDir: BlobDir.projects,
                          uploadHintText: 'Browse File',
                        );
                      },
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[4],
                      validate: true,
                      validator: (url) {
                        if (url!.trim().isEmpty) {
                          return ''.fieldIsRequired;
                        }
                        if (!isValidUrl(url)) {
                          return 'Enter valid URL';
                        }
                      },
                      label: 'Project URL',
                      hintText: 'Enter the URL here',
                    ),
                    CustomTextFieldWidget(
                      validator: (url) {
                        if (url!.trim().isEmpty) {
                          return ''.fieldIsRequired;
                        }

                        if (!isValidUrl(url)) {
                          return 'Enter valid URL';
                        }
                      },
                      controller: _textController[5],
                      validate: true,
                      label: 'Any Reference URL (Github / G Drive)',
                      hintText: 'Enter the reference URL here',
                    ),
                    Gap($style.insets.sm)
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
            final currentState = context.watch<ProjectCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      mediaFile ??= getIt<FilePickerCubit>().fileBytes;
                      if (mediaFile == null) {
                        context.showCustomSnackbar();
                      }
                      if (_formKey.currentState!.validate() &&
                          mediaFile != null) {
                        model = model.copyWith(
                          programName: handleNullString(_textController[0]),
                          role: handleNullString(_textController[1]),
                          description: handleNullString(_textController[3]),
                          projectUrl: handleEmptyString(
                            _textController[4],
                            isUrl: true,
                          ),
                          referenceUrl: handleEmptyString(
                            _textController[5],
                            isUrl: true,
                          ),
                          currentlyDeveloping: statusVisibilityNotifier.value,
                          startDate: convertDate(
                            _textController[6].text,
                            toReverse: true,
                          ),
                          endDate: convertDate(
                            _textController[7].text,
                            toReverse: true,
                          ),
                        );
                        context.read<ProjectCubit>().saveProjectInfo(
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
