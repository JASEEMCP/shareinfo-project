import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/domain/profile/model/personal_info_model/personal_info_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_search_field.dart';
import 'package:shareinfo/presentation/widget/snack_bar_custom.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenContactInformation extends StatefulWidget {
  const ScreenContactInformation({super.key});

  @override
  State<ScreenContactInformation> createState() =>
      _ScreenContactInformationState();
}

class _ScreenContactInformationState extends State<ScreenContactInformation> {
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 750));
  //Form key validator
  final _formKey = generateFormKey();

  //Generating text editing controller
  final _textController = List.generate(9, (index) => generateTextController());

  ///Candidate info model
  PersonalInfoModel model = PersonalInfoModel();
  @override
  void dispose() {
    getIt<PersonalInfoCubit>().clearData();
    _textController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<PersonalInfoCubit>().getPersonalInfo();
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) {
            return buildCustomAppBar(
              context,
              title: 'Personal Information',
              enableSuffixIcon: false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
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
                    context.read<PersonalInfoCubit>().getPersonalInfo();
                  },
                );
              }
              model = state.userData;

              ///Assigning textfield value
              _textController[0].text = model.phoneNo ?? '';
              _textController[1].text = model.email ?? '';
              _textController[2].text = model.address ?? '';
              _textController[3].text =
                  handleIntegerNullString(model.postalPin);
              _textController[4].text = model.city ?? '';
              _textController[5].text = model.district ?? '';
              _textController[6].text = model.state ?? '';
              _textController[7].text = convertDate(model.dob) ?? '';
              _textController[8].text = model.gender ?? '';

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      controller: _textController[0],
                      readOnly: true,
                      label: 'Mobile Number',
                      hintText: 'Mobile Number',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[1],
                      readOnly: true,
                      label: 'E-Mail ID',
                      hintText: 'E-Mail ID',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextFieldWidget(
                            inputFormatter: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            controller: _textController[7],
                            label: 'Date of Birth',
                            hintText: 'DD/MM/YYYY',
                            validate: true,
                            validator: (_) => validateDateFormat(
                                _textController[7].text.trim()),
                            suffix: IconButton(
                              onPressed: () async {
                                final startDate = await selectDate(
                                  context,
                                  initialDate: DateTime.now(),
                                  lastDate: DateTime.now(),
                                  firstDate: DateTime(1970, 01, 01),
                                );
                                if (startDate == null) return;
                                _textController[7].text = convertDate(
                                      '${startDate.year}-${startDate.month}-${startDate.day}'
                                          .trim(),
                                    ) ??
                                    '';
                                model.dob =
                                    '${startDate.year}-${startDate.month}-${startDate.day}';
                              },
                              icon: const Icon(Icons.calendar_month_outlined),
                            ),
                          ),
                        ),
                        Gap($style.insets.sm),
                        Expanded(
                          child: CustomDropDownSearch(
                            validate: true,
                            enableController: false,
                            menuController: _textController[8],
                            label: 'Gender',
                            hintText: 'Select a Gender',
                            onSelect: (value) {
                              _textController[8].text = value?.label ?? '';
                            },
                            menu: [
                              MenuItem(0, 'Male'),
                              MenuItem(0, 'Female'),
                              MenuItem(0, 'Rather Not To Say'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Contact Details',
                      style: $style.text.textBold14.copyWith(
                        color: context.theme.imiotDarkPurple,
                      ),
                    ),
                    Gap($style.insets.md),
                    CustomTextFieldWidget(
                      controller: _textController[2],
                      validate: true,
                      label: 'Address',
                      hintText: 'Enter Your Address here...',
                      onChanged: (address) {
                        _debouncer.call(() {
                          model.address = address;
                        });
                      },
                    ),
                    CustomTextFieldWidget(
                      validate: true,
                      validator: (postalCode) {
                        if (isEmptyForm(postalCode)) {
                          return 'This field is Required';
                        } else {
                          if (isValidPincode(postalCode!)) {
                            return null;
                          } else {
                            return 'Enter valid postal code';
                          }
                        }
                      },
                      controller: _textController[3],
                      keyboardType: TextInputType.number,
                      suffix: state.fetchingPincode
                          ? const CupertinoActivityIndicator()
                          : const SizedBox.shrink(),
                      onChanged: (postalCode) {
                        _debouncer.call(
                          () {
                            if (isValidPincode(postalCode)) {
                              ///getting postal address
                              context
                                  .read<PersonalInfoCubit>()
                                  .fetchPinCodeAddress(
                                    int.parse(postalCode),
                                    model,
                                  );
                            }
                          },
                        );
                      },
                      label: 'Postal PIN',
                      hintText: 'Enter your POSTAL PIN here...',
                    ),
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[4],
                      label: 'City',
                      hintText: 'Enter your City',
                      onChanged: (city) {
                        _debouncer.call(() {
                          model.city = city;
                        });
                      },
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[5],
                      label: 'District',
                      readOnly: true,
                      hintText: 'Enter your District',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[6],
                      label: 'State',
                      readOnly: true,
                      hintText: 'Enter your State',
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
            final currentState = context.watch<PersonalInfoCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    disable: currentState.fetchingPincode,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_textController.isItemEmpty(5) ||
                            _textController.isItemEmpty(6)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              showSnackBar('Enter valid postal code'));
                          return;
                        }
                        model = model.copyWith(
                          dob: convertDate(
                            _textController[7].text,
                            toReverse: true,
                          ),
                          gender: handleNullString(_textController[8]),
                          address: handleEmptyString(_textController[2]),
                          city: handleEmptyString(_textController[4]),
                        );
                        //Saving personal info
                        context
                            .read<PersonalInfoCubit>()
                            .savePersonalInfo(model);
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
