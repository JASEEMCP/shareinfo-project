import 'dart:async';

import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/candidate_profile_model/candidate_profile_model.dart';

import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/profile/widget/image_picker_button.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenMyProfile extends StatefulWidget {
  const ScreenMyProfile({super.key});

  @override
  State<ScreenMyProfile> createState() => _ScreenMyProfileState();
}

class _ScreenMyProfileState extends State<ScreenMyProfile> {
  ///Form validator key
  final _formKey = generateFormKey();

  ///FileByte object to store image path

  Uint8List? imageBytes;

  ///Store image url of user profile
  String? imageUrl;

  ///
  late StreamSubscription profileSubscription;

  ///Candidate info model
  CandidateProfileModel model = CandidateProfileModel();
  //flag variable user edited its profile
  bool isEdited = false;

  @override
  void initState() {
    super.initState();

    profileSubscription = context.read<ImagePickerCubit>().stream.listen(
      (state) {
        if (state.isEdited) {
          isEdited = true;
        } else {
          isEdited = false;
        }
      },
    );
  }

  ///Generating list of text editing controller
  final candidateTextController =
      List.generate(5, (index) => generateTextController());

  @override
  void dispose() {
    super.dispose();

    //Clear image picker data
    getIt<ImagePickerCubit>().rollbackToInitialState();
    profileSubscription.cancel();
    for (final controller in candidateTextController) {
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = $style.insets;
    String? mediaType;

    ///Calling candidate data model at  building ui
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context
            .read<CandidateProfileBloc>()
            .add(const CandidateProfileEvent.getCandidateProfile());
      },
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) {
            return buildCustomAppBar(
              context,
              title: 'My Profile',
              enableSuffixIcon: false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingTop(),
          child: BlocConsumer<CandidateProfileBloc, CandidateProfileState>(
            listener: (context, state) {
              //show success message for  user is edited their profile
              if (state.submissionSuccess) {
                context.showCustomSnackbarAtTop();
                return;
              }
            },
            builder: (context, state) {
              ///Ui is loading state return circular progress indicator
              if (state.isLoading) {
                return const CustomCircularProgressIndicatorC();
              } else if (state.isError) {
                return NetWorkError(
                  padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                  onRefresh: () {
                    context
                        .read<CandidateProfileBloc>()
                        .add(const CandidateProfileEvent.getCandidateProfile());
                  },
                );
              }

              model = state.userData;
              imageUrl = model.profilePhoto;

              ///Assigning textfield value
              candidateTextController[0].text = model.firstName ?? '';
              candidateTextController[1].text = model.middleName ?? '';
              candidateTextController[2].text = model.lastName ?? '';
              candidateTextController[3].text = model.currentPosition ?? '';
              candidateTextController[4].text = model.currentOrganization ?? '';

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(120),
                                  onTap: () {
                                    _showBottomSheetProfile(context, imageUrl);
                                  },
                                  child: BlocBuilder<ImagePickerCubit,
                                      ImagePickerState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () => Icon(
                                          Icons.person,
                                          size: 60,
                                          color: Colors.grey.shade600,
                                        ),
                                        imagePicked: (imageB, type) {
                                          mediaType = type;
                                          //_holdImageLoad(image);

                                          return Image.memory(
                                            imageB!,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                        imageLoaded: (imageUrl) {
                                          return imageUrl == null
                                              ? Icon(
                                                  Icons.person,
                                                  size: 60,
                                                  color: Colors.grey.shade600,
                                                )
                                              : Image.network(
                                                  profileUrl(),
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Center(
                                                      child: Icon(
                                                        Icons.photo,
                                                        size: 30,
                                                        color: Colors
                                                            .grey.shade600,
                                                      ),
                                                    );
                                                  },
                                                  frameBuilder: (context, child,
                                                      loadingProgress, s) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return Center(
                                                        child: Icon(
                                                          Icons.photo,
                                                          size: 30,
                                                          color: Colors
                                                              .grey.shade600,
                                                        ),
                                                      );
                                                    }

                                                    return child;
                                                  },
                                                );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),

                            ///Edit icon
                            Positioned(
                              right: 5,
                              bottom: 5,
                              child: GestureDetector(
                                onTap: () {
                                  _showBottomSheetProfile(context, imageUrl);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(style.xxxs),
                                  decoration: BoxDecoration(
                                    color: context.theme.shareinfoWhite,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: context.theme.imiotDarkPurple,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    size: 17,
                                    color: context.theme.imiotDarkPurple,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap($style.insets.xl),
                    CustomTextFieldWidget(
                      controller: candidateTextController[0],
                      validate: true,
                      hintText: 'Enter Your First Name here...',
                      label: 'First Name',
                    ),
                    CustomTextFieldWidget(
                      controller: candidateTextController[1],
                      hintText: 'Enter Your Middle name here...',
                      label: 'Middle Name',
                    ),
                    CustomTextFieldWidget(
                      controller: candidateTextController[2],
                      hintText: 'Enter Your last name here...',
                      label: 'Last Name',
                    ),
                    CustomTextFieldWidget(
                      controller: candidateTextController[3],
                      validate: true,
                      hintText: 'Enter Role here...',
                      label: 'Current Position',
                    ),
                    CustomTextFieldWidget(
                      controller: candidateTextController[4],
                      label: 'Current Organization (Optional)',
                      hintText: 'Enter Your Organization Name here...',
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
        child: Builder(
          builder: (context) {
            final currentState = context.watch<CandidateProfileBloc>().state;
            imageBytes = context.watch<ImagePickerCubit>().state.maybeWhen(
                  orElse: () => null,
                  imagePicked: (imageByte, _) => imageByte,
                );
            //Prevent show save button while data fetching time
            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSubmittingProfile,
                    buttonName: 'Submit Profile',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model = model.copyWith(
                          firstName:
                              handleEmptyString(candidateTextController[0]),
                          middleName:
                              handleEmptyString(candidateTextController[1]),
                          lastName:
                              handleEmptyString(candidateTextController[2]),
                          currentPosition:
                              handleNullString(candidateTextController[3]),
                          currentOrganization:
                              handleNullString(candidateTextController[4]),
                          profilePhoto: model.profilePhoto,
                        );

                        ///Saving user data
                        context.read<CandidateProfileBloc>().add(
                              CandidateProfileEvent.saveCandidateProfile(
                                model,
                                imageBytes,
                                isEdited,
                                mediaType,
                              ),
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

  Future<dynamic> _showBottomSheetProfile(
      BuildContext context, String? imageUrl) {
    return showModalBottomSheet(
      backgroundColor: context.theme.shareinfoWhite,
      context: context,
      constraints: BoxConstraints(
        maxHeight: 170,
        minWidth: 100 * context.w,
        maxWidth: 100 * context.w,
      ),
      builder: (context) {
        ///replacing  image file with old image data
        imageBytes = context.watch<ImagePickerCubit>().state.maybeWhen(
              orElse: () => null,
              imagePicked: (imageBytes, _) => imageBytes,
            );
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile photo',
              textScaler: const TextScaler.linear(1),
              style: $style.text.textBold16.copyWith(
                color: context.theme.imiotDarkPurple,
              ),
            ),
            Gap($style.insets.sm),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ImagePickerButton(
                    onTap: () {
                      ///Pick image from gallery
                      context.read<ImagePickerCubit>().pickImageFromGallery();
                      context.pop();
                      // _clearImage(imageUrl);
                    },
                    label: 'Photo',
                    backgroundColor: context.theme.statusGreen,
                    iconColor: context.theme.statusGreenAccentDark,
                    icon: Icons.photo,
                  ),
                ),
                Expanded(
                  child: ImagePickerButton(
                    onTap: () {
                      //Take image from camera
                      context.read<ImagePickerCubit>().takePicture();
                      context.pop();
                      // _clearImage(imageUrl);
                    },
                    label: 'Camera',
                    backgroundColor: context.theme.statusPurple,
                    iconColor: context.theme.statusPurpleAccentDark,
                    icon: Icons.camera_alt,
                  ),
                ),
                Visibility(
                  //Showing remove bottom depending on  isVisible variable
                  visible: model.profilePhoto != null || imageBytes != null,
                  child: Expanded(
                    child: ImagePickerButton(
                      onTap: () async {
                        //assigning profile photo into null
                        model.profilePhoto = null;
                        //_clearImage(imageUrl);
                        context.read<ImagePickerCubit>().removePicture();
                      },
                      label: 'Remove',
                      backgroundColor: context.theme.statusRed,
                      iconColor: context.theme.statusRedAccentDark,
                      icon: Icons.delete,
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
