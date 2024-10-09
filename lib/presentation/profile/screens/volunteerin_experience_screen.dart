import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/volunteering_exp_model/volunteering_exp_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenVolunteeringExperience extends StatefulWidget {
  const ScreenVolunteeringExperience({super.key, this.id});

  final int? id;

  @override
  State<ScreenVolunteeringExperience> createState() =>
      _ScreenVolunteeringExperienceState();
}

class _ScreenVolunteeringExperienceState
    extends State<ScreenVolunteeringExperience> {
  final _formKey = generateFormKey();
  //This is used to enable and disable subtitle
  final ValueNotifier<bool> statusVisibilityNotifier = ValueNotifier(false);
  final _textController = List.generate(7, (index) => generateTextController());
  VolunteeringExpModel model = VolunteeringExpModel();

  @override
  void dispose() {
    _textController.clear();
    statusVisibilityNotifier.dispose();
    getIt<VolunteeringExperienceCubit>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //redirecting separate screen with respect to [id]
        if (widget.id != null) {
          context
              .read<VolunteeringExperienceCubit>()
              .getVolunteeringExpInfo(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess =
              context.watch<WorkExperienceCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "Volunteering Experience",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context
                      .read<VolunteeringExperienceCubit>()
                      .deleteVolunteeringExpInfo();
                },
              );
            },
          );
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<VolunteeringExperienceCubit,
              VolunteeringExperienceState>(
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
                              .read<VolunteeringExperienceCubit>()
                              .getVolunteeringExpInfo(widget.id!);
                        }
                      : null,
                );
              }
              model = state.userModel;

              _textController[0].text = model.title ?? '';
              _textController[1].text = model.organization ?? '';
              _textController[2].text = model.role ?? '';
              _textController[3].text = model.description ?? '';
              _textController[4].text = model.organizationWebsite ?? '';
              _textController[5].text = convertDate(model.startDate) ?? '';
              _textController[6].text = convertDate(model.endDate) ?? '';

              statusVisibilityNotifier.value = model.isOngoing ?? false;

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      controller: _textController[0],
                      validate: true,
                      hintText: 'Enter title',
                      label: 'Title',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[1],
                      validate: true,
                      hintText: 'Issued organization name',
                      label: 'Organization',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[2],
                      hintText: 'Enter the Credential ID',
                      label: 'Role (Optional)',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextFieldWidget(
                            inputFormatter: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            bottomPadding: 0,
                            controller: _textController[5],
                            label: 'Date Of Issue',
                            hintText: 'DD/MM/YYYY',
                            validate: true,
                            validator: (_) => validateDateFormat(
                                _textController[5].text.trim()),
                            suffix: IconButton(
                              onPressed: () async {
                                final startDate = await selectDate(
                                  context,
                                  initialDate: DateTime.now(),
                                  lastDate: DateTime.now(),
                                  firstDate: DateTime(1970, 01, 01),
                                );
                                if (startDate == null) return;
                                _textController[5].text = convertDate(
                                      '${startDate.year}-${startDate.month}-${startDate.day}'
                                          .trim(),
                                    ) ??
                                    '';
                                model.startDate =
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
                                bottomPadding: 0,
                                inputFormatter: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                controller: _textController[6],
                                label: 'Expiration',
                                hintText: 'DD/MM/YYYY',
                                validate: true,
                                validator: (_) => enabled
                                    ? null
                                    : validateDateFormat(
                                        _textController[6].text.trim(),
                                      ),
                                suffix: IconButton(
                                  onPressed: () async {
                                    final endDate = await selectDate(
                                      context,
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime.now(),
                                      firstDate:
                                          convertToDateTime(model.startDate) ??
                                              DateTime(1970, 01, 01),
                                    );
                                    if (endDate == null) return;
                                    _textController[6].text = convertDate(
                                            '${endDate.year}-${endDate.month}-${endDate.day}'
                                                .trim()) ??
                                        '';
                                    model.endDate =
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
                        model.endDate = null;
                        _textController[6].clear();
                        statusVisibilityNotifier.value = val ?? false;
                      },
                      statusVisibilityNotifier: statusVisibilityNotifier,
                      statusText: "Still I'm Volunteering",
                    ),
                    MultiLineTextField(
                      controller: _textController[3],
                      label: 'Description (Optional)',
                      hintText:
                          'Enter a brief about the role you were done at the organization through out the duration of your employment....',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[4],
                      hintText: 'URL Link',
                      label: 'Link of the Organization Website (Optional)',
                      validate: true,
                      validator: (url) {
                        if (url!.trim().isEmpty) {
                          return null;
                        }
                        var uri = Uri.tryParse(url);

                        if (uri!.host.isEmpty) {
                          return 'Please enter valid url';
                        }
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
            final currentState =
                context.watch<VolunteeringExperienceCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model = model.copyWith(
                          title: handleEmptyString(_textController[0]),
                          organization: handleNullString(_textController[1]),
                          role: handleNullString(_textController[2]),
                          description: handleNullString(_textController[3]),
                          isOngoing: statusVisibilityNotifier.value,
                          organizationWebsite: handleEmptyString(
                            _textController[4],
                            isUrl: true,
                          ),
                          startDate: convertDate(
                            _textController[5].text,
                            toReverse: true,
                          ),
                          endDate: convertDate(
                            _textController[6].text,
                            toReverse: true,
                          ),
                        );

                        context
                            .read<VolunteeringExperienceCubit>()
                            .saveProfessionalExam(
                              model,
                              requestTypeHandleWithId(widget.id),
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
}
