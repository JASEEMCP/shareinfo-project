import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/profile/model/affiliations_model/affiliations_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenAffiliations extends StatefulWidget {
  const ScreenAffiliations({super.key, this.id});
  final int? id;

  @override
  State<ScreenAffiliations> createState() => _ScreenAffiliationsState();
}

class _ScreenAffiliationsState extends State<ScreenAffiliations> {
  final _formKey = generateFormKey();
  final _textController = List.generate(5, (index) => generateTextController());
  //This is used to enable and disable subtitle
  final ValueNotifier<bool> statusVisibilityNotifier = ValueNotifier(false);
  AffiliationsModel model = AffiliationsModel();

  @override
  void dispose() {
    _textController.clear();
    statusVisibilityNotifier.dispose();
    getIt<AffiliationsCubit>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //redirecting separate screen with respect to [id]
        if (widget.id != null) {
          context.read<AffiliationsCubit>().retrieveAffiliations(widget.id!);
        }
      },
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess = context.watch<AffiliationsCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            title: "Affiliations",
            absorbing: !isSuccess,
            enableSuffixIcon: widget.id != null ? true : false,
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context.read<AffiliationsCubit>().deleteAffiliation();
                },
              );
            },
          );
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<AffiliationsCubit, AffiliationsState>(
            listener: (context, state) {
              //show success message for  user is edited their profile
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
                              .read<AffiliationsCubit>()
                              .retrieveAffiliations(widget.id!);
                        }
                      : null,
                );
              }
              model = state.userModel;

              _textController[0].text = model.organization ?? '';
              _textController[1].text = model.role ?? '';
              _textController[2].text = model.description ?? '';
              _textController[3].text = convertDate(model.fromDate) ?? '';
              _textController[4].text = convertDate(model.toDate) ?? '';

              statusVisibilityNotifier.value = model.isOngoing ?? false;

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      validate: true,
                      controller: _textController[0],
                      hintText: 'Enter Organization Name here',
                      label: 'Organization',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[1],
                      hintText: 'Enter the Role here',
                      label: 'Role(Optional)',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextFieldWidget(
                            inputFormatter: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            controller: _textController[3],
                            label: 'From',
                            hintText: 'DD/MM/YYYY',
                            validate: true,
                            bottomPadding: 0,
                            validator: (_) => validateDateFormat(
                                _textController[3].text.trim()),
                            suffix: IconButton(
                              onPressed: () async {
                                final startDate = await selectDate(
                                  context,
                                  initialDate: DateTime.now(),
                                  lastDate: DateTime.now(),
                                  firstDate: DateTime(1970, 01, 01),
                                );
                                if (startDate == null) return;
                                _textController[3].text = convertDate(
                                      '${startDate.year}-${startDate.month}-${startDate.day}'
                                          .trim(),
                                    ) ??
                                    '';
                                model.fromDate =
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
                                controller: _textController[4],
                                label: 'To',
                                bottomPadding: 0,
                                hintText: 'DD/MM/YYYY',
                                validate: true,
                                validator: (_) => enabled
                                    ? null
                                    : validateDateFormat(
                                        _textController[4].text.trim(),
                                      ),
                                suffix: IconButton(
                                  onPressed: () async {
                                    final endDate = await selectDate(
                                      context,
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime.now(),
                                      firstDate:
                                          convertToDateTime(model.fromDate) ??
                                              DateTime(1970, 01, 01),
                                    );
                                    if (endDate == null) return;
                                    _textController[4].text = convertDate(
                                            '${endDate.year}-${endDate.month}-${endDate.day}'
                                                .trim()) ??
                                        '';
                                    model.toDate =
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
                        model.toDate = null;
                        _textController[4].clear();
                        statusVisibilityNotifier.value = val ?? false;
                      },
                      statusVisibilityNotifier: statusVisibilityNotifier,
                      statusText: "Still I'm a Member",
                    ),
                    MultiLineTextField(
                      controller: _textController[2],
                      label: 'Description (Optional)',
                      hintText:
                          'Enter a brief about the role you were done at the organization through out the duration of your employment..',
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
            final currentState = context.watch<AffiliationsCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        model = model.copyWith(
                          organization: handleNullString(_textController[0]),
                          role: handleNullString(_textController[1]),
                          description: handleNullString(_textController[2]),
                          isOngoing: statusVisibilityNotifier.value,
                          fromDate: convertDate(
                            _textController[3].text,
                            toReverse: true,
                          ),
                          toDate: convertDate(
                            _textController[4].text,
                            toReverse: true,
                          ),
                        );
                        context.read<AffiliationsCubit>().saveAffiliation(
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
