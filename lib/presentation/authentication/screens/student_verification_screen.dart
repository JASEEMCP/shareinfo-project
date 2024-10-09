import 'package:flutter/services.dart';
import 'package:shareinfo/application/auth/profile_submission_cubit/student_profile_submission_cubit.dart';
import 'package:shareinfo/application/profile/common/shared_states.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/auth/model/institute_list_model/institute_list_model/institute_list_model.dart';
import 'package:shareinfo/domain/profile/model/academic_info_model/academic_info_model.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/authentication/screens/institute_selection_screen.dart';
import 'package:shareinfo/presentation/authentication/widget/shareinfo_logo_widget.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_search_field.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';

class ScreenStudentVerification extends StatefulWidget {
  const ScreenStudentVerification({
    super.key,
    required this.instituteModel,
  });
  final InstituteListModel instituteModel;

  @override
  State<ScreenStudentVerification> createState() =>
      _ScreenStudentVerificationState();
}

class _ScreenStudentVerificationState extends State<ScreenStudentVerification>
    with AutomaticKeepAliveClientMixin<ScreenStudentVerification> {
  @override
  bool get wantKeepAlive => true;
  final List<TextEditingController> _textController =
      List.generate(11, (index) => generateTextController());
//Form key validator
  final _formKey = generateFormKey();
  //getting sign up data from previous page
  final ValueNotifier<String?> yearNotifier = ValueNotifier('');
  final ValueNotifier<String?> scaleNotifier = ValueNotifier('');

  ///Candidate info model
  AcademicInfoModel model = AcademicInfoModel();
  Uint8List? frontView;
  Uint8List? backView;
  @override
  void dispose() {
    super.dispose();
    _textController.clear();
    yearNotifier.dispose();
    scaleNotifier.dispose();
    getIt<ImagePickerCubit>().rollbackToInitialState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final inset = $style.insets;
    String? mediaNameFront;
    String? mediaNameBack;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<DepartmentListCubit>()
          .getDepartmentList(preProfileModel.currentInstitute ?? -1);
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) {
            return buildCustomAppBar(
              context,
              title: 'Verify Student Profile',
              enableSuffixIcon: false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocBuilder<DepartmentListCubit, DepartmentListState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                fetchingDepartmentList: () =>
                    const CustomCircularProgressIndicatorC(),
                error: (e) => NetWorkError(
                  onRefresh: () {
                    context.read<DepartmentListCubit>().getDepartmentList(
                        preProfileModel.currentInstitute ?? -1);
                  },
                ),
                successToLoad: (instituteData) {
                  ///Assigning textfield value
                  _textController[0].text =
                      widget.instituteModel.fullName ?? '';

                  scaleNotifier.value = instituteData.cgpaScale.toString();
                  _textController[4].text = instituteData.cgpaScale.toString();

                  return Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          buildShareInfoLogo(context),
                          Center(
                            child: Text(
                              'VERIFY YOUR STUDENT PROFILE',
                              style: $style.text.textBold16.copyWith(
                                color: context.theme.shareinfoBlue,
                              ),
                            ),
                          ),
                          Gap(inset.md),
                          CustomTextFieldWidget(
                            controller: _textController[0],
                            readOnly: true,
                            label: 'Institute Name',
                            hintText: 'Enter your Institute Name',
                          ),
                          CustomDropDownSearch(
                            validate: true,
                            enableController: true,
                            menuController: _textController[9],
                            label: 'Stream',
                            hintText: 'Enter your stream of studying',
                            onSelect: (value) {
                              _textController[9].text = value?.label ?? '';
                            },
                            menu: [
                              for (var dept in instituteData.departments ?? [])
                                MenuItem(0, dept),
                            ],
                          ),
                          Gap(inset.md),
                          CustomTextFieldWidget(
                            validate: true,
                            controller: _textController[8],
                            inputFormatter: [UpperCaseTextFormatter()],
                            label: 'Uni.Register Number',
                            hintText: 'Enter your register Id',
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomDropDownSearch(
                                  validate: true,
                                  enableController: true,
                                  menuController: _textController[1],
                                  label: 'Course Period',
                                  hintText: 'From',
                                  onSelect: (value) {
                                    _textController[1].text =
                                        value?.label ?? '';
                                    yearNotifier.value = value?.label ??
                                        DateTime.now().year.toString();
                                  },
                                  menu: [
                                    for (int year = DateTime.now().year;
                                        year >= 2015;
                                        year--)
                                      MenuItem(0, year.toString())
                                  ],
                                ),
                              ),
                              Gap(inset.sm),
                              ValueListenableBuilder(
                                valueListenable: yearNotifier,
                                builder: (context, endYear, _) {
                                  final convertedY = stringToInt(endYear) ??
                                      DateTime.now().year;
                                  return Expanded(
                                    child: CustomDropDownSearch(
                                      enabled: endYear?.trim().isNotEmpty,
                                      validate: true,
                                      enableController: true,
                                      menuController: _textController[2],
                                      label: '',
                                      hintText: 'To',
                                      onSelect: (value) {
                                        _textController[2].text =
                                            value?.label ?? '';
                                      },
                                      menu: [
                                        for (int year = (convertedY + 1);
                                            year < (convertedY + 10);
                                            year++)
                                          MenuItem(0, year.toString())
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Gap(inset.md),
                          CustomDropDownSearch(
                            validate: true,
                            enableController: true,
                            menuController: _textController[10],
                            label: 'Current Semester',
                            hintText: 'Select Your  Current Semester',
                            onSelect: (value) {
                              _textController[10].text = value?.label ?? '';
                            },
                            menu: [
                              MenuItem(0, 'S1'),
                              MenuItem(0, 'S2'),
                              MenuItem(0, 'S3'),
                              MenuItem(0, 'S4'),
                              MenuItem(0, 'S5'),
                              MenuItem(0, 'S6'),
                              MenuItem(0, 'S7'),
                              MenuItem(0, 'S8'),
                            ],
                          ),
                          Gap($style.insets.md),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomTextFieldWidget(
                                  maxLine: 1,
                                  validate: true,
                                  controller: _textController[4],
                                  keyboardType: TextInputType.number,
                                  readOnly: true,
                                  label: 'Scale',
                                  hintText: 'Enter a GPA Scale',
                                ),
                              ),
                              Gap(inset.sm),
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
                                                      _textController[4]
                                                          .text
                                                          .trim())) {
                                            return 'Enter valid GPA scale';
                                          }
                                          return null;
                                        } catch (e) {
                                          return 'Enter valid GPA scale';
                                        }
                                      },
                                      validate: true,
                                      controller: _textController[3],
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
                          //Backlog count
                          CustomTextFieldWidget(
                            maxLine: 1,
                            controller: _textController[5],
                            validate: true,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'This field is Required';
                              }
                              if (!isInteger(value)) {
                                return 'Enter valid input';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            label: 'Backlogs (Current)',
                            hintText: 'Enter Backlogs',
                          ),

                          Builder(builder: (context) {
                            /// Assign front view name
                            frontView =
                                context.watch<ImagePickerCubit>().frontView;

                            context.read<ImagePickerCubit>().state.maybeWhen(
                                  orElse: () => null,
                                  frontImage: (frontImageByte, fileName) {
                                    frontView = frontImageByte;
                                    mediaNameFront = fileName;
                                  },
                                );
                            if (frontView != null) {
                              markNeedToBuild(
                                  mediaNameFront ?? '', _textController[6]);
                            }
                            return CustomTextFieldWidget(
                              readOnly: true,
                              maxLine: 1,
                              validate: true,
                              validator: (_) {
                                if (frontView == null) {
                                  return 'Student id is Required';
                                }
                                return null;
                              },
                              controller: _textController[6],
                              prefix: const Icon(Icons.image),
                              suffix: IconButton(
                                onPressed: () {
                                  context
                                      .read<ImagePickerCubit>()
                                      .pickStudentId(IdView.front);
                                },
                                icon: const Icon(Icons.upload),
                              ),
                              keyboardType: TextInputType.number,
                              label: 'Upload your Collage Identity Card',
                              hintText:
                                  'Upload Front Side of Your Institute ID Card ',
                            );
                          }),
                          Builder(
                            builder: (context) {
                              /// Assign back view name
                              backView =
                                  context.watch<ImagePickerCubit>().backView;

                              context.read<ImagePickerCubit>().state.maybeWhen(
                                    orElse: () => null,
                                    backImage: (backImageByte, imageBack) {
                                      backView = backImageByte;
                                      mediaNameBack = imageBack;
                                    },
                                  );
                              if (backView != null) {
                                markNeedToBuild(
                                    mediaNameBack ?? '', _textController[7]);
                              }
                              return CustomTextFieldWidget(
                                suffix: IconButton(
                                  onPressed: () {
                                    context
                                        .read<ImagePickerCubit>()
                                        .pickStudentId(IdView.back);
                                  },
                                  icon: const Icon(Icons.upload),
                                ),
                                validator: (_) {
                                  if (backView == null) {
                                    return 'Student id is Required';
                                  }
                                  return null;
                                },
                                controller: _textController[7],
                                maxLine: 1,
                                readOnly: true,
                                validate: true,
                                prefix: const Icon(Icons.image),
                                keyboardType: TextInputType.number,
                                hintText:
                                    'Upload Back Side of Your Institute ID Card',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar:
          BlocConsumer<StudentProfileSubmissionCubit, SharedState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => null,
            error: (e) => ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(
                e.errorDescription,
              ),
            ),
            storageError: (_) => context.showUploadFailed(),
            success: () => context.go(ScreenPath.home),
          );
        },
        builder: (context, state) {
          return Padding(
            padding: customPaddingBottom(),
            child: Builder(
              builder: (context) {
                final currentState = context.watch<DepartmentListCubit>().state;

                return !currentState.isLoading && !currentState.isError
                    ? CustomElevatedButton(
                        buttonName: 'Continue',
                        isLoading: state.isUploading,
                        progress: state.maybeWhen(
                          orElse: () => null,
                          uploading: (progress) => progress,
                        ),
                        width: ElevatedButtonWidth.large,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            preProfileModel = preProfileModel.copyWith(
                              registerId: handleEmptyString(_textController[8],
                                  toUpper: true),
                              stream: handleNullString(_textController[9]),
                              startDate: stringToInt(_textController[1].text),
                              endDate: stringToInt(_textController[2].text),
                              currentSemester:
                                  handleNullString(_textController[10]),
                              cgpa: stringToDouble(_textController[3].text),
                              scale: stringToInt(_textController[4].text),
                              backlogs: stringToInt(_textController[5].text),
                            );

                            context
                                .read<StudentProfileSubmissionCubit>()
                                .submitProfile(preProfileModel,
                                    isStudent: true,
                                    frontView: frontView,
                                    backView: backView,
                                    mediaTypeBack:
                                        mediaNameBack?.split('.').last,
                                    mediaTypeFront:
                                        mediaNameFront?.split('.').last);
                          }
                        },
                      )
                    : const SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }

  void markNeedToBuild(String path, TextEditingController controller) async {
    await Future.delayed(const Duration(milliseconds: 500));
    controller.text = path;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
