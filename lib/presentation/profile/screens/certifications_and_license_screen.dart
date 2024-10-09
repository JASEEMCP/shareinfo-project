import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/certificate_model/certificate_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/upload_document_widget.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenCertificationAndLicenses extends StatefulWidget {
  const ScreenCertificationAndLicenses({super.key, this.id});

  final int? id;

  @override
  State<ScreenCertificationAndLicenses> createState() =>
      _ScreenCertificationAndLicensesState();
}

class _ScreenCertificationAndLicensesState
    extends State<ScreenCertificationAndLicenses> {
  final _formKey = generateFormKey();
  //This is used to enable and disable subtitle
  final ValueNotifier<bool> statusVisibilityNotifier = ValueNotifier(false);
  final _textController = List.generate(6, (index) => generateTextController());
  CertificateModel model = CertificateModel();
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
    filePickerSubscription.cancel();
    getIt<CertificateCubit>().clearData();
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
          context.read<CertificateCubit>().retrieveCertificateInfo(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess = context.watch<CertificateCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            absorbing: !isSuccess,
            title: 'Certification & Licenses',
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context
                      .read<CertificateCubit>()
                      .deleteCertificate(model.media);
                },
              );
            },
          );
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<CertificateCubit, CertificateState>(
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
                              .read<CertificateCubit>()
                              .retrieveCertificateInfo(widget.id!);
                        }
                      : null,
                );
              }
              model = state.userModel;

              _textController[0].text = model.name ?? '';
              _textController[1].text = model.issuingOrganization ?? '';
              _textController[2].text = model.credentialId ?? '';
              _textController[3].text = model.credentialUrl ?? '';
              _textController[4].text = convertDate(model.issueDate) ?? '';
              _textController[5].text = convertDate(model.expirationDate) ?? '';
              statusVisibilityNotifier.value = model.expires ?? false;
              mediaFile = context.read<FilePickerCubit>().fileBytes;

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[0],
                      label: 'Title',
                      hintText: 'Enter Certification title',
                    ),
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[1],
                      label: 'Publishing Organization',
                      hintText: 'Issued Organization Name',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextFieldWidget(
                            inputFormatter: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            controller: _textController[4],
                            label: 'From',
                            hintText: 'DD/MM/YYYY',
                            validate: true,
                            bottomPadding: 0,
                            validator: (_) => validateDateFormat(
                                _textController[4].text.trim()),
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
                                model.issueDate =
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
                                controller: _textController[5],
                                label: 'To',
                                bottomPadding: 0,
                                hintText: 'DD/MM/YYYY',
                                validate: true,
                                validator: (_) => enabled
                                    ? null
                                    : validateDateFormat(
                                        _textController[5].text.trim(),
                                      ),
                                suffix: IconButton(
                                  onPressed: () async {
                                    final endDate = await selectDate(
                                      context,
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime.now(),
                                      firstDate:
                                          convertToDateTime(model.issueDate) ??
                                              DateTime(1970, 01, 01),
                                    );
                                    if (endDate == null) return;
                                    _textController[5].text = convertDate(
                                            '${endDate.year}-${endDate.month}-${endDate.day}'
                                                .trim()) ??
                                        '';
                                    model.expirationDate =
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
                        model.expirationDate = null;
                        _textController[5].clear();
                        statusVisibilityNotifier.value = val ?? false;
                      },
                      statusVisibilityNotifier: statusVisibilityNotifier,
                      statusText: "this credential will not expire",
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[2],
                      label: 'Credential ID (Optional)',
                      hintText: 'Enter the Credential ID...',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[3],
                      validate: true,
                      validator: (url) {
                        if (url!.trim().isEmpty) {
                          return null;
                        }

                        if (!isValidUrl(url)) {
                          return 'Enter valid URL';
                        }
                      },
                      label: 'Credential URL (Optional)',
                      hintText: 'Enter the Credential URL...',
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
                          label: 'Add Certificate File',
                          blobDir: BlobDir.certificate,
                          uploadHintText: 'Browse file',
                          currentState: currentState.state,
                        );
                      },
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
            final currentState = context.watch<CertificateCubit>().state;

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
                          name: handleNullString(_textController[0]),
                          issuingOrganization:
                              handleNullString(_textController[1]),
                          credentialId: handleEmptyString(
                            _textController[2],
                            isUrl: true,
                          ),
                          credentialUrl: handleEmptyString(
                            _textController[3],
                            isUrl: true,
                          ),
                          expires: statusVisibilityNotifier.value,
                          issueDate: convertDate(
                            _textController[4].text,
                            toReverse: true,
                          ),
                          expirationDate: convertDate(
                            _textController[5].text,
                            toReverse: true,
                          ),
                        );

                        context.read<CertificateCubit>().saveCertificateInfo(
                              model,
                              mediaFile,
                              requestTypeHandleWithId(widget.id),
                              mediaName,
                              isEdited: isEdited,
                            );
                        isEdited = false;
                      }
                    })
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
