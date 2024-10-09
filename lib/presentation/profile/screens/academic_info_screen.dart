import 'package:shareinfo/application/profile/academic_info_cubit/academic_info_cubit.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/profile/model/academic_info_model/academic_info_model.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_search_field.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenAcademicInformation extends StatefulWidget {
  const ScreenAcademicInformation({super.key});

  @override
  State<ScreenAcademicInformation> createState() =>
      _ScreenAcademicInformationState();
}

class _ScreenAcademicInformationState extends State<ScreenAcademicInformation> {
  //Form key validator
  final _formKey = generateFormKey();

  //Generating text editing controller
  final _textController = List.generate(8, (index) => generateTextController());
  final ValueNotifier<String?> scaleNotifier = ValueNotifier(null);

  ///Candidate info model
  AcademicInfoModel model = AcademicInfoModel();
  @override
  void dispose() {
    getIt<AcademicInfoCubit>().clearData();
    _textController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<AcademicInfoCubit>().getAcademicInfo();
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) {
            return buildCustomAppBar(
              context,
              title: 'Academic Information',
              enableSuffixIcon: false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<AcademicInfoCubit, AcademicInfoState>(
            listener: (context, state) {
              //show success message for  user is edited their profile
              if (state.saveSuccess) {
                context.showCustomSnackbarAtTop();
                return;
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const CustomCircularProgressIndicatorC();
              } else if (state.isError) {
                return NetWorkError(
                  padding: const EdgeInsets.only(top: kTextTabBarHeight + 35),
                  onRefresh: () {
                    context.read<AcademicInfoCubit>().getAcademicInfo();
                  },
                );
              }
              model = state.userData;

              ///Assigning textfield value
              _textController[0].text = model.currentInstitute ?? '';
              _textController[1].text = model.stream ?? '';
              _textController[2].text =
                  handleIntegerNullString(model.startDate);
              _textController[3].text = handleIntegerNullString(model.endDate);
              _textController[4].text = handleDoubleNullString(model.cgpa);
              _textController[5].text = handleIntegerNullString(model.backlogs);
              _textController[6].text = handleIntegerNullString(model.scale);
              _textController[7].text = model.currentSemester ?? '';

              ///Assign value of gender and birth date

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    //Institute name
                    CustomTextFieldWidget(
                      maxLine: 1,
                      controller: _textController[0],
                      readOnly: true,
                      label: 'Current Institute',
                      hintText: 'Enter your Institute',
                    ),
                    //Stream
                    CustomTextFieldWidget(
                      maxLine: 1,
                      controller: _textController[1],
                      readOnly: true,
                      label: 'Stream',
                      hintText: 'Enter your stream of studying',
                    ),
                    //Academic period
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextFieldWidget(
                            maxLine: 1,
                            keyboardType: TextInputType.number,
                            controller: _textController[2],
                            readOnly: true,
                            label: 'From',
                            hintText: 'From',
                          ),
                        ),
                        Gap($style.insets.sm),
                        Expanded(
                          child: CustomTextFieldWidget(
                            maxLine: 1,
                            keyboardType: TextInputType.number,
                            controller: _textController[3],
                            readOnly: true,
                            label: 'To',
                            hintText: 'To',
                          ),
                        ),
                      ],
                    ),
                    //Semester
                    CustomDropDownSearch(
                      validate: true,
                      enableController: true,
                      menuController: _textController[7],
                      label: 'Current Semester',
                      hintText: 'Enter Your Semester',
                      onSelect: (value) {
                        _textController[7].text = value?.label ?? '';
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
                            readOnly: true,
                            maxLine: 1,
                            controller: _textController[6],
                            label: 'GPA Scale',
                            hintText: 'Choose a GPA Scale',
                          ),
                        ),
                        Gap($style.insets.sm),
                        Expanded(
                          child: CustomTextFieldWidget(
                            maxLine: 1,
                            validate: true,
                            validator: (value) {
                              if (_textController[4].text.trim().isEmpty) {
                                return null;
                              }
                              if (!isDouble(value!) ||
                                  double.parse(value) >
                                      double.parse('${model.scale}')) {
                                return 'Enter valid GPA';
                              }
                              return null;
                            },
                            controller: _textController[4],
                            enabled: true,
                            keyboardType: TextInputType.number,
                            label: 'Current GPA',
                            hintText: 'Enter GPA here',
                          ),
                        ),
                      ],
                    ),
                    //Backlog count
                    CustomTextFieldWidget(
                      maxLine: 1,
                      controller: _textController[5],
                      validate: true,
                      validator: (value) {
                        if (!isDouble(value!)) {
                          return 'Enter valid GPA scale';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      label: 'Backlogs (Current)',
                      hintText: 'Enter Backlogs',
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
            //Hide save button while state is loading or error
            final currentState = context.watch<AcademicInfoCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model = model.copyWith(
                          currentSemester: handleNullString(_textController[7]),
                          backlogs: stringToInt(_textController[5].text),
                          cgpa: stringToDouble(_textController[4].text),
                        );
                        //Saving academic info
                        context
                            .read<AcademicInfoCubit>()
                            .saveAcademicInfo(model);
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
