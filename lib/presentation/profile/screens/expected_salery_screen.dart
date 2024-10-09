import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/expected_salary_model/expected_salary_model.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_search_field.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenExpectedSalary extends StatefulWidget {
  const ScreenExpectedSalary({super.key});

  @override
  State<ScreenExpectedSalary> createState() => _ScreenExpectedSalaryState();
}

class _ScreenExpectedSalaryState extends State<ScreenExpectedSalary> {
  final _formKey = generateFormKey();

  final _textController = List.generate(6, (index) => generateTextController());

  ExpectedSalaryModel model = ExpectedSalaryModel();

  String? _checkSalaryIsValid(String? salary, bool onlySalary) {
    if (onlySalary) {
      if (isEmptyForm(salary)) {
        return null;
      } else {
        if (isInteger(salary!)) {
          return null;
        } else {
          return 'Enter valid salary';
        }
      }
    }
    if (isEmptyForm(salary)) {
      return 'This field is Required';
    } else {
      if (isInteger(salary!)) {
        return null;
      } else {
        return 'Enter valid salary';
      }
    }
  }

  @override
  void dispose() {
    getIt<ExpectedSalaryCubit>().clearData();
    _textController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<ExpectedSalaryCubit>().getExpectedSalary(),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (context) {
            return buildCustomAppBar(
              context,
              title: 'Expected Salary',
              enableSuffixIcon: false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<ExpectedSalaryCubit, ExpectedSalaryState>(
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
                    context.read<ExpectedSalaryCubit>().getExpectedSalary();
                  },
                );
              }
              model = state.userModel;

              _textController[0].text =
                  handleIntegerNullString(model.minimumFulltime);
              _textController[1].text =
                  handleIntegerNullString(model.maximumFulltime);
              _textController[2].text =
                  handleIntegerNullString(model.minimumInternship);
              _textController[3].text =
                  handleIntegerNullString(model.maximumInternship);
              //assign value frequency and currency
              _textController[4].text = model.currency ?? '';
              _textController[5].text = model.frequency ?? '';

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      controller: _textController[0],
                      validate: true,
                      validator: (salary) => _checkSalaryIsValid(salary, true),
                      label: 'Minimum (Full Time)',
                      hintText: 'Enter a amount in your preferred currency',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[1],
                      validate: true,
                      validator: (salary) => _checkSalaryIsValid(salary, false),
                      label: 'Maximum (Full Time)',
                      hintText: 'Enter a amount in your preferred currency',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[2],
                      label: 'Minimum (Internship)',
                      validate: true,
                      validator: (salary) => _checkSalaryIsValid(salary, true),
                      hintText: 'Enter a amount in your preferred currency',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[3],
                      validate: true,
                      validator: (salary) => _checkSalaryIsValid(salary, true),
                      label: 'Maximum (Internship)',
                      hintText: 'Enter a amount in your preferred currency',
                      keyboardType: TextInputType.number,
                    ),
                    CustomDropDownSearch(
                      validate: true,
                      enableController: false,
                      menuController: _textController[4],
                      label: 'Currency',
                      hintText: 'Select a Currency',
                      onSelect: (value) {
                        _textController[4].text = value?.label ?? '';
                      },
                      menu: [
                        MenuItem(0, 'INR'),
                      ],
                    ),
                    Gap($style.insets.md),
                    CustomDropDownSearch(
                      validate: true,
                      enableController: false,
                      menuController: _textController[5],
                      label: 'Frequency',
                      hintText: 'Select frequency',
                      onSelect: (value) {
                        _textController[5].text = value?.label ?? '';
                      },
                      menu: [
                        MenuItem(0, 'Monthly'),
                      ],
                    ),
                    Gap($style.insets.md),
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
          final currentState = context.watch<ExpectedSalaryCubit>().state;
          return !currentState.isLoading && !currentState.isError
              ? CustomElevatedButton(
                  isLoading: currentState.isSaving,
                  buttonName: 'Save',
                  width: ElevatedButtonWidth.large,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      model = model.copyWith(
                        minimumFulltime: stringToInt(_textController[0].text),
                        maximumFulltime: stringToInt(_textController[1].text),
                        minimumInternship: stringToInt(_textController[2].text),
                        maximumInternship: stringToInt(_textController[3].text),
                        currency: handleNullString(_textController[4]),
                        frequency: handleNullString(_textController[5]),
                      );
                      context
                          .read<ExpectedSalaryCubit>()
                          .saveExpectedSalary(model);
                    }
                  },
                )
              : const SizedBox.shrink();
        }),
      ),
    );
  }
}
