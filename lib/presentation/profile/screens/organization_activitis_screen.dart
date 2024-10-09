import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/organization_activity_model/organization_activity_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/upload_document_widget.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenOrganizationAndActivity extends StatefulWidget {
  const ScreenOrganizationAndActivity({super.key, this.id});
  final int? id;

  @override
  State<ScreenOrganizationAndActivity> createState() =>
      _ScreenOrganizationAndActivityState();
}

class _ScreenOrganizationAndActivityState
    extends State<ScreenOrganizationAndActivity> {
  final _formKey = generateFormKey();
  //This is used to enable and disable subtitle
  final ValueNotifier<bool> statusVisibilityNotifier = ValueNotifier(false);
  final _textController = List.generate(5, (index) => generateTextController());
  OrganizationActivityModel model = OrganizationActivityModel();
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
    statusVisibilityNotifier.dispose();
    filePickerSubscription.cancel();
    getIt<OrganizationActivitiesCubit>().clearData();
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
          context
              .read<OrganizationActivitiesCubit>()
              .retrieveOrganizationActivities(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess =
              context.watch<OrganizationActivitiesCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "Organization Activities",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context
                      .read<OrganizationActivitiesCubit>()
                      .deleteOrganizationActivities(model.idCard);
                },
              );
            },
          );
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<OrganizationActivitiesCubit,
              OrganizationActivitiesState>(
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
                              .read<OrganizationActivitiesCubit>()
                              .retrieveOrganizationActivities(widget.id!);
                        }
                      : null,
                );
              }
              model = state.userModel;

              _textController[0].text = model.organization ?? '';
              _textController[1].text = model.role ?? '';
              _textController[2].text = model.description ?? '';
              _textController[3].text = convertDate(model.fromDate) ?? '';
              _textController[4].text = convertDate(model.toDate) ?? '';
              statusVisibilityNotifier.value = model.isOngoing ?? false;

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[0],
                      label: 'Organization',
                      hintText: 'Enter Organization Name',
                    ),
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[1],
                      label: 'Role',
                      hintText: 'Enter your Role',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextFieldWidget(
                            inputFormatter: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            controller: _textController[3],
                            label: 'From',
                            bottomPadding: 0,
                            hintText: 'DD/MM/YYYY',
                            validate: true,
                            validator: (_) => validateDateFormat(
                                _textController[3].text.trim()),
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
                                model.fromDate =
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
                                controller: _textController[4],
                                label: 'To',
                                bottomPadding: 0,
                                hintText: 'DD/MM/YYYY',
                                validate: true,
                                validator: (_) => enabled
                                    ? null
                                    : validateDateFormat(
                                        _textController[4].text.trim(),
                                      ),
                                suffix: IconButton(
                                  onPressed: () async {
                                    final endDate = await selectDate(
                                      context,
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime.now(),
                                      firstDate:
                                          convertToDateTime(model.fromDate) ??
                                              DateTime(1970, 01, 01),
                                    );
                                    if (endDate == null) return;
                                    _textController[4].text = convertDate(
                                            '${endDate.year}-${endDate.month}-${endDate.day}'
                                                .trim()) ??
                                        '';
                                    model.toDate =
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
                        model.toDate = null;
                        _textController[4].clear();
                        statusVisibilityNotifier.value = val ?? false;
                      },
                      statusVisibilityNotifier: statusVisibilityNotifier,
                      statusText: "Still I’m Member",
                    ),
                    MultiLineTextField(
                      controller: _textController[2],
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
                          label: 'Organizational ID Card',
                          uploadHintText: 'Browse file',
                          blobDir: BlobDir.organizationActivities,
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
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: Builder(builder: (context) {
          final currentState =
              context.watch<OrganizationActivitiesCubit>().state;

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
                        organization: handleNullString(_textController[0]),
                        role: handleNullString(_textController[1]),
                        description: handleNullString(_textController[2]),
                        fromDate: convertDate(
                          _textController[3].text,
                          toReverse: true,
                        ),
                        toDate: convertDate(
                          _textController[4].text,
                          toReverse: true,
                        ),
                        isOngoing: statusVisibilityNotifier.value,
                      );

                      context
                          .read<OrganizationActivitiesCubit>()
                          .saveOrganizationActivities(
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
        }),
      ),
    );
  }
}
