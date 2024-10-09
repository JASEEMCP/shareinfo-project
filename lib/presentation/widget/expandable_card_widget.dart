import 'package:flutter/services.dart';
import 'package:shareinfo/application/practice/enrolled_process_list_cubit/enrolled_process_list_cubit.dart';
import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/helper_widget.dart';

import 'logo_frame_widget.dart';

class ExpandableCardWidget extends StatefulWidget {
  const ExpandableCardWidget({
    super.key,
    this.processName,
    this.processStep,
    this.description,
    this.status,
    required this.id,
    //required this.expandedCardNotifier,
  });

  final String? processName;
  final String? processStep;
  final String? description;
  final String? status;
  final String id;
  //final ValueNotifier<bool> expandedCardNotifier;

  @override
  State<ExpandableCardWidget> createState() => _ExpandableCardWidgetState();
}

class _ExpandableCardWidgetState extends State<ExpandableCardWidget> {
  final GlobalKey _contentKey = GlobalKey();

  bool isExpanded = false;

  _expandContainer(bool status) {
    if (status) return;
    HapticFeedback.mediumImpact();
    if (!isExpanded) {
      context
          .read<EnrolledProcessListCubit>()
          .getSpecificProcessDetail(widget.id);
    } else {
      // widget.expandedCardNotifier.value = !isExpanded;
      setState(() {
        isExpanded = !isExpanded;
      });
      //context.read<EnrolledProcessListCubit>().setStateToInitial();
    }
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    bool isUpcoming = widget.status?.toTitleCase() == 'Upcoming';
    bool isActive = widget.status?.toTitleCase() == 'Active';
    bool isSubmitted = widget.status?.toTitleCase() == 'Submitted';

    return Opacity(
      opacity: isUpcoming ? 0.7 : 1,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            width: context.w * 100,
            decoration: applySmoothBorder(
              context,
              radius: 13,
              width: 1.2,
            ),
            duration: const Duration(milliseconds: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(inset.xl),
                GestureDetector(
                  onTap: () {
                    _expandContainer(isUpcoming);
                  },
                  child: Text(
                    'Step ${widget.processStep}',
                    style: $style.text.textBold14.copyWith(
                      color: context.theme.shareinfoGrey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _expandContainer(isUpcoming);
                  },
                  child: Text(
                    '${widget.processName}',
                    textAlign: TextAlign.center,
                    style: $style.text.textBold16.copyWith(
                      color: context.theme.shareinfoBlue,
                    ),
                  ),
                ),
                Gap(inset.xxs),
                if (!isExpanded && !isUpcoming)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: inset.sm),
                    child: Text(
                      '${widget.description}',
                      maxLines: isExpanded ? null : 3,
                      style: $style.text.textBold10.copyWith(
                        color: context.theme.shareinfoGrey,
                        overflow: isExpanded ? null : TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                if (!isExpanded) Gap(inset.xs),
                if (!isExpanded && isActive && !isSubmitted)
                  //Logo and button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: inset.sm),
                    child: Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: LogoFrameWidget(
                              imagePath: ImagePaths.shareInfoLogo,
                              imageSize: 40,
                              radius: 6,
                            ),
                          ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            _expandContainer(isUpcoming);
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(inset.xs),
                                bottomRight: Radius.circular(inset.xl),
                                topRight: Radius.circular(inset.xs),
                                topLeft: Radius.circular(inset.xl),
                              ),
                            ),
                            backgroundColor: context.theme.shareinfoBlue,
                          ),
                          child: Text(
                            'Complete Now.!',
                            style: $style.text.textSBold12.copyWith(
                              color: context.theme.shareinfoWhite,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                Gap(inset.xs),
                BlocConsumer<EnrolledProcessListCubit,
                    EnrolledProcessListState>(
                  listenWhen: (previous, current) => current.isSuccess,
                  listener: (context, state) {
                    String currentId = (state.maybeWhen(
                      orElse: () => 'null',
                      success: (m) =>
                          m.processList?[0].specificProcessDetail?.processId.toString() ?? '',
                    ));

                    if (widget.id == currentId && state.isSuccess) {
                      //   print('hai');
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    }
                    // widget.expandedCardNotifier.value = !isExpanded;
                    // if (state.isSuccess) {
                    //   widget.expandedCardNotifier.value =
                    //       !widget.expandedCardNotifier.value;
                    // }

                    //}
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      success: (bulletList) {
                        List<TextEditingController> txtController =
                            List.generate(
                          bulletList.processList?[0].specificProcessDetail?.urls?.length ?? 0,
                          (index) {
                            TextEditingController txt = TextEditingController(
                                text: bulletList.processList?[0].specificProcessDetail
                                        ?.urls?[index].submittedUrl?.fileUrl ??
                                    '');
                            return txt;
                          },
                        );

                        return TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 500),
                          tween: Tween<double>(
                            begin: 0.0,
                            end: isExpanded
                                ? 1.0
                                : 0.0, // Animate between expanded and collapsed state
                          ),
                          builder: (context, value, child) {
                            return ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: value, // Control height factor
                                child: child,
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: inset.sm),
                            width: double.maxFinite,
                            key:
                                _contentKey, // This key allows measuring the intrinsic height
                            color: context.theme.shareinfoWhite,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (String txt in bulletList
                                        .processList?[0].specificProcessDetail
                                        ?.taskDescription ??
                                    [])
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "\u2022",
                                        style: $style.text.textSBold10.copyWith(
                                          color: context.theme.shareinfoGrey,
                                        ),
                                      ),
                                      Gap(inset.xs),
                                      Expanded(
                                        child: Text(
                                          txt,
                                          style:
                                              $style.text.textSBold10.copyWith(
                                            color: context.theme.shareinfoGrey,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                Gap(inset.xxs),
                                if (bulletList.processList?[0].specificProcessDetail != null)
                                  for (int index = 0;
                                      index <
                                          bulletList.processList![0].specificProcessDetail!.urls!.length;
                                             
                                      index++)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: CustomTextFieldWidget(
                                            validate: true,
                                            validator: (url) {
                                              if (url!.trim().isEmpty) {
                                                return ''.fieldIsRequired;
                                              }

                                              if (!isValidUrl(url)) {
                                                return 'Enter valid URL';
                                              }
                                            },
                                            controller: txtController[index],
                                            label: bulletList.processList?[0]
                                                .specificProcessDetail
                                                ?.urls?[index]
                                                .urlTitle,
                                            hintText: 'Enter URL here..!',
                                            labelTxtColor:
                                                context.theme.shareinfoGrey,
                                            suffix: IconButton(
                                              onPressed: () {
                                                // if (bulletList
                                                //         .specificProcessDetail
                                                //         ?.urls?[index]
                                                //         .hintVideoUrl !=
                                                //     null) {
                                                //   openWeb(bulletList
                                                //       .specificProcessDetail
                                                //       ?.urls?[index]
                                                //       .hintVideoUrl);
                                                // }
                                              },
                                              icon:
                                                  const Icon(Icons.open_in_new),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: isVisible,
                                          child: Radio(
                                            value: true,
                                            groupValue: 'enable',
                                            onChanged: (val) {},
                                          ),
                                        )
                                      ],
                                    ),
                                if (isActive)
                                  CustomElevatedButton(
                                    backgroundColor: isActive
                                        ? null
                                        : context.theme.shareinfoGreyLite,
                                    buttonName: isActive
                                        ? 'Submit Now!'
                                        : 'Request Edit Submission!',
                                    width: ElevatedButtonWidth.large,
                                    onPressed: () {
                                      setState(() {
                                        //isVisible = !isVisible;
                                      });
                                    },
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                isExpanded
                    ? Gap(inset.md)
                    : isUpcoming
                        ? const Gap(0)
                        : Gap(inset.md),
              ],
            ),
          ),

          /// Status card
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        _getStatusColor(context, widget.status?.toTitleCase())
                            .withOpacity(0.6),
                    blurRadius: 0,
                  ),
                  BoxShadow(
                    color: context.theme.shareinfoWhite,
                    blurRadius: 4,
                    spreadRadius: -2,
                  ),
                ],
                border: Border.all(
                  color: _getStatusColor(context, widget.status?.toTitleCase()),
                ),
              ),
              child: Row(
                children: [
                  Gap(inset.xxs),
                  Icon(
                    Icons.circle,
                    color:
                        _getStatusColor(context, widget.status?.toTitleCase()),
                    size: 20,
                  ),
                  Text(
                    ' ${widget.status}',
                    maxLines: 1,
                    textScaler: const TextScaler.linear(1),
                    style: $style.text.textBold12.copyWith(
                      color: _getStatusColor(
                          context, widget.status?.toTitleCase()),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // expanded arrow
          Positioned(
            left: 0,
            right: 0,
            bottom: -10,
            child: GestureDetector(
              onTap: () {
                _expandContainer(isUpcoming);
              },
              child: Center(
                child: Container(
                  color: context.theme.shareinfoWhite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gap(inset.xxxs),
                      _buildDynamicArrow(context, isExpanded),
                      _buildDynamicArrow(context, isExpanded),
                      _buildDynamicArrow(context, isExpanded),
                      Gap(inset.xxxs),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedRotation _buildDynamicArrow(BuildContext context, bool isExpanded) {
    return AnimatedRotation(
      turns: isExpanded ? 0.5 : 0, // 0.5 for 180 degrees rotation (down to up)
      duration: const Duration(milliseconds: 500), // Animation duration
      child: Icon(
        Icons.expand_circle_down_outlined,
        color: context.theme.shareinfoGreen,
      ),
    );
  }

  Color _getStatusColor(BuildContext context, String? status) {
    switch (status) {
      case 'Active':
        return context.theme.imiotDarkPurple;
      case 'Submitted':
        return context.theme.shareinfoGreen;
      default:
        return context.theme.shareinfoYellow;
    }
  }
}
