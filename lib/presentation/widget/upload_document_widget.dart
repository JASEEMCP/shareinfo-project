import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/presentation/core/extension.dart';
import 'package:shareinfo/presentation/root_widget.dart';
import 'package:shareinfo/presentation/widget/pdf_loaded_widget.dart';

class UploadDocumentWidget extends StatelessWidget {
  const UploadDocumentWidget({
    super.key,
    required this.label,
    required this.uploadHintText,
    required this.currentState,
    this.onBrowse,
    this.onRemove,
    this.blobDir,
  });
  final String label;
  final String uploadHintText;
  final String? blobDir;
  final FilePickerState currentState;
  final Function? onBrowse;
  final Function? onRemove;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final style = $style.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: style.textBold14.copyWith(
            color: context.theme.imiotDarkPurple,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Gap(inset.xxs),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          dashPattern: const [10, 10],
          color: context.theme.shareinfoGreyLite,
          strokeWidth: 2,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: inset.sm,
              vertical: inset.sm,
            ),
            decoration: BoxDecoration(
              color: context.theme.shareinfoWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: BlocListener<FilePickerCubit, FilePickerState>(
              listener: (context, state) {
                if (state.isUnsupportedMedia) {
                  return context.showUnsupportedMedia();
                }
                if (state.isSizeExceed) {
                  context.showSizeExceedWarning();
                }
              },
              child: currentState.maybeWhen(
                orElse: () => _buildFileBrowseButton(context),
                edited: (fileName, fileSize, fileBytes) {
                  return PdfLoadedSkeltonWidget(
                    documentName: fileName,
                    fileSize: fileSize,
                    onTap: () {
                      context.read<FilePickerCubit>().viewFile(
                            fileBytes,
                            fileName,
                            blobPath: blobDir,
                          );
                    },
                    onRemove: () {
                      onRemove != null ? onRemove!() : () {};
                    },
                  );
                },
                filePicked: (fileName, fileSize, fileBytes, filePath) {
                  return PdfLoadedSkeltonWidget(
                    documentName: fileName,
                    fileSize: fileSize,
                    onTap: () {
                      context.read<FilePickerCubit>().viewFile(
                            fileBytes,
                            filePath,
                            blobPath: blobDir,
                          );
                    },
                    onRemove: () {
                      onRemove != null ? onRemove!() : () {};
                    },
                  );
                },
              ),
            ),
          ),
        ),
        Gap(inset.lg),
      ],
    );
  }

  Column _buildFileBrowseButton(BuildContext context) {
    final style = $style.text;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            onBrowse != null ? onBrowse!() : () {};
          },
          icon: const Icon(Icons.publish),
        ),
        Text(
          uploadHintText,
          style: style.textSBold10.copyWith(
            color: context.theme.imiotDarkPurple,
          ),
        ),
      ],
    );
  }
}
