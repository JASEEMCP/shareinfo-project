import 'dart:async';

import 'package:shareinfo/application/profile/common/shared_states.dart';
import 'package:shareinfo/application/profile/cv_resume_cubit.dart/update_cv_resume_cubit.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/profile_model/cv_resume_set.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/upload_document_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenResume extends StatefulWidget {
  const ScreenResume({super.key, this.id});
  final int? id;

  @override
  State<ScreenResume> createState() => _ScreenResumeState();
}

class _ScreenResumeState extends State<ScreenResume> {
  late StreamSubscription filePickerSubscription;
  //cv/resume model
  CvResumeSet model = CvResumeSet();
  //Document file
  Uint8List? mediaFile;

  bool isEdited = false;
  @override
  void initState() {
    filePickerSubscription = context.read<FilePickerCubit>().stream.listen(
      (state) {
        ///Flagging isEdited value into true when user is browse new file from local storage
        if (state.isEdited) {
          isEdited = true;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    filePickerSubscription.cancel();
    getIt<CvResumeCubit>().clearData();
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
          ///Going to cv/resume manage screen
          context.read<CvResumeCubit>().retrieveCvResume(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess = context.watch<CvResumeCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "CV / Resume",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context.read<CvResumeCubit>().deleteCvResume(model.cv);
                },
              );
            },
          );
        }),
      ),
      body: Padding(
        padding: customPaddingBottom(),
        child: BlocListener<UpdateCvResumeCubit, SharedState>(
          listener: (context, state) {
            //show success message for  user is edited their profile
            if (widget.id != null && state.isSuccess) {
              context.showCustomSnackbarAtTop();
              return;
              //navigate profile page user is add new profile row
            } else if (widget.id == null && state.isSuccess) {
              return context.pop();
            }
          },
          child: BlocConsumer<CvResumeCubit, CvResumeState>(
              listener: (context, state) {
            //navigate profile page if user is delete a row
            if (state.deleteSuccess) return context.pop();
          }, builder: (context, state) {
            if (state.isLoading) {
              return const CustomCircularProgressIndicatorC();
            } else if (state.isError) {
              return NetWorkError(
                padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                onRefresh: widget.id != null
                    ? () {
                        context
                            .read<CvResumeCubit>()
                            .retrieveCvResume(widget.id!);
                      }
                    : null,
              );
            }
            model = state.cvInfo;
            return ListView(
              children: [
                Builder(
                  builder: (context) {
                    // Get file bytes
                    mediaFile = context.watch<FilePickerCubit>().fileBytes;
                    // Get file Name
                    mediaName = context.watch<FilePickerCubit>().fileName;
                    final currentState = context.watch<FilePickerCubit>().state;
                    return UploadDocumentWidget(
                      label: "Upload CV / Resume",
                      uploadHintText: "Browse file",
                      currentState: currentState,
                      blobDir: BlobDir.cvResume,
                      onRemove: () {
                        context.read<FilePickerCubit>().removeFile();
                      },
                      onBrowse: () {
                        context.read<FilePickerCubit>().browseFile();
                      },
                    );
                  },
                ),
                //const PdfLoadedSkeltonWidget(),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: customPaddingBottom(),
        child: BlocListener<UpdateCvResumeCubit, SharedState>(
          listener: (context, state) {
            if (state.isStorageError) {
              isEdited = true;
              return context.showUploadFailed();
            }
          },
          child: Builder(
            builder: (context) {
              final updateState = context.watch<UpdateCvResumeCubit>().state;
              final currentState = context.watch<CvResumeCubit>().state;
              return !currentState.isLoading && !currentState.isError
                  ? CustomElevatedButton(
                      progress: updateState.maybeWhen(
                        orElse: () => null,
                        uploading: (progress) => progress,
                      ),
                      isLoading: updateState.isUploading,
                      buttonName: "Save",
                      width: ElevatedButtonWidth.large,
                      onPressed: () async {
                        if (mediaFile != null) {
                          await context
                              .read<UpdateCvResumeCubit>()
                              .updateResume(
                                mediaFile,
                                model,
                                requestTypeHandleWithId(widget.id),
                                mediaName,
                                isEdited: isEdited,
                              );
                          //isEdited value change into false after calling file upload event
                          isEdited = false;
                          return;
                        }
                        context.showCustomSnackbar();
                      },
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
