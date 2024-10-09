import 'dart:async';

import 'package:flutter/services.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/domain/profile/model/work_experience_model/domain_list_model.dart';

import 'package:shareinfo/domain/profile/model/work_experience_model/work_experience_model.dart';
import 'package:shareinfo/presentation/core/date_time_util.dart';
import 'package:shareinfo/presentation/profile/widget/app_bar_widget.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/custom_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/drop_down_search_field.dart';
import 'package:shareinfo/presentation/widget/drop_down_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/multiline_textfield_widget.dart';
import 'package:shareinfo/presentation/widget/upload_document_widget.dart';
import 'package:shareinfo/presentation/widget/views/date_picker_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenWorkExperience extends StatefulWidget {
  ScreenWorkExperience({super.key, this.id});
  final int? id;
  final scKey = GlobalKey<ScaffoldState>();
  @override
  State<ScreenWorkExperience> createState() => _ScreenWorkExperienceState();
}

class _ScreenWorkExperienceState extends State<ScreenWorkExperience>
    with AutomaticKeepAliveClientMixin<ScreenWorkExperience> {
  @override
  bool get wantKeepAlive => true;

  WorkExperienceModel model = WorkExperienceModel();
  late StreamSubscription filePickerSubscription;
  final _formKey = generateFormKey();
  final _textController =
      List.generate(11, (index) => generateTextController());
  //This is used to enable and disable subtitle
  final ValueNotifier<bool> statusVisibilityNotifier = ValueNotifier(false);
  //Media file object
  Uint8List? mediaFile;

  ValueNotifier<List<DomainListModel>> domainList = ValueNotifier([]);

  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 200));
  //store value is media file id edited or not
  bool isEdited = false;
  @override
  void initState() {
    filePickerSubscription = context.read<FilePickerCubit>().stream.listen(
      (state) {
        if (state.isEdited) {
          isEdited = true;
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _textController.clear();
    filePickerSubscription.cancel();
    statusVisibilityNotifier.dispose();
    getIt<FilePickerCubit>().removeFile();
    getIt<WorkExperienceCubit>().clearData();
    super.dispose();
  }

  _searchDomain(List<DomainListModel> items, String query) {
    if (query.trim().isEmpty) {
      domainList.value = [];
      return;
    }
    domainList.value = items.where(
      (element) {
        return element.domainName!.toLowerCase().contains(query.toLowerCase());
      },
    ).toList();
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    int? domainId;

    String? mediaName;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        //redirecting separate screen with respect to [id]
        if (widget.id != null) {
          context
              .read<WorkExperienceCubit>()
              .retrieveWorkExperience(widget.id!);
        } else {
          context.read<WorkExperienceCubit>().getDomainList();
        }
      },
    );

    return Scaffold(
      key: widget.scKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(builder: (context) {
          final isSuccess =
              context.watch<WorkExperienceCubit>().state.isSuccess;
          return buildCustomAppBar(
            context,
            absorbing: !isSuccess,
            title: "Work Experience",
            onSuffixIconPressed: () {
              context.deleteWarningMessage(
                () async {
                  await context
                      .read<WorkExperienceCubit>()
                      .deleteWorkExperience(model.media);
                },
              );
            },
            //if id is null screen type is create item otherwise is manage item
            enableSuffixIcon: widget.id != null ? true : false,
          );
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: customPaddingBottom(),
          child: BlocConsumer<WorkExperienceCubit, WorkExperienceState>(
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
                  onRefresh: () {
                    if (widget.id != null) {
                      context
                          .read<WorkExperienceCubit>()
                          .retrieveWorkExperience(widget.id!);
                    } else {
                      context.read<WorkExperienceCubit>().getDomainList();
                    }
                  },
                );
              }

              //Assign model
              model = state.userModel;

              ///Assign controller values
              _textController[0].text = model.title ?? '';
              _textController[1].text = model.company ?? '';
              _textController[2].text = model.description ?? '';
              _textController[3].text = model.location ?? '';
              _textController[4].text =
                  handleIntegerNullString(model.recentSalary);
              _textController[5].text = convertDate(model.startDate) ?? '';
              _textController[6].text = convertDate(model.endDate) ?? '';
              _textController[7].text = model.employmentType ?? '';
              _textController[8].text = model.jobLevel ?? '';
              _textController[9].text = model.domain ?? '';
              _textController[10].text = model.currency ?? '';
              //Get domain id by name
              domainId = _getIdByDomainName(model.domain);

              statusVisibilityNotifier.value = model.currentlyWorking ?? false;
              //Initialize variable

              return Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CustomTextFieldWidget(
                      controller: _textController[0],
                      validate: true,
                      label: 'Job Title',
                      hintText: 'Enter your Job title here..!',
                    ),
                    CustomTextFieldWidget(
                      controller: _textController[1],
                      validate: true,
                      label: 'Company',
                      hintText: 'Enter the Company Name',
                    ),
                    //Date
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextFieldWidget(
                            inputFormatter: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            controller: _textController[5],
                            label: 'From',
                            bottomPadding: 0,
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
                                inputFormatter: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                controller: _textController[6],
                                label: 'To',
                                bottomPadding: 0,
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
                      statusText: "I Currently Work here",
                    ),
                    //role description
                    MultiLineTextField(
                      controller: _textController[2],
                      label: 'Description (Optional)',
                      hintText:
                          'Enter a brief about the role you were done at the organization through out the duration of your employment....',
                    ),

                    //employment type
                    CustomDropDownSearch(
                      validate: true,
                      enableController: true,
                      menuController: _textController[7],
                      label: 'Employment Type',
                      hintText: 'Select the type of Employment',
                      onSelect: (value) {
                        _textController[7].text = value?.label ?? '';
                      },
                      menu: [
                        MenuItem(0, 'Full Time'),
                        MenuItem(0, 'Part Time'),
                        MenuItem(0, 'Internship'),
                        MenuItem(0, 'Training'),
                        MenuItem(0, 'Freelancing'),
                      ],
                    ),
                    Gap($style.insets.md),
                    //location
                    CustomTextFieldWidget(
                      maxLine: 1,
                      controller: _textController[3],
                      validate: true,
                      label: 'Location',
                      hintText: 'Enter the City or Location',
                    ),
                    Gap($style.insets.md),
                    //job level
                    CustomDropDownSearch(
                      validate: true,
                      enableController: true,
                      menuController: _textController[8],
                      label: 'Job Level',
                      hintText: 'Select a level of your Employment',
                      onSelect: (value) {
                        _textController[8].text = value?.label ?? '';
                      },
                      menu: [
                        MenuItem(0, 'Trainee'),
                        MenuItem(0, 'B-Level'),
                        MenuItem(0, 'Manager'),
                        MenuItem(0, 'Intern'),
                        MenuItem(0, 'Freelancer'),
                        MenuItem(0, 'Senior Manager'),
                        MenuItem(0, 'Project Head'),
                        MenuItem(0, 'Department Head'),
                        MenuItem(0, 'Other'),
                      ],
                    ),
                    Gap($style.insets.md),
                    //Domain
                    ValueListenableBuilder(
                        valueListenable: domainList,
                        builder: (context, searchList, _) {
                          return CustomDropDownSearch(
                            validate: true,
                            enableController: true,
                            enableFilter: false,
                            onChanged: (value) {
                              _debouncer.call(() {
                                _searchDomain(
                                  model.domainList ?? [],
                                  value?.trim() ?? '',
                                );
                              });
                            },
                            menuController: _textController[9],
                            label: 'Domain of Employment',
                            hintText: 'Search Domain...',
                            onSelect: (value) {
                              /// Domain id is used to update domain data
                              domainId = _getIdByDomainName(value?.label ?? '');

                              _textController[9].text = value?.label ?? '';
                            },
                            menu: [
                              for (var item in searchList)
                                MenuItem(0, item.domainName ?? ''),
                            ],
                          );
                        }),
                    Gap($style.insets.md),

                    //Gpa and scale
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextFieldWidget(
                            validator: (salary) {
                              if (salary!.trim().isEmpty) {
                                return 'This field is Required';
                              } else if (!isInteger(salary)) {
                                return 'Enter valid salary amount';
                              }
                              return null;
                            },
                            controller: _textController[4],
                            keyboardType: TextInputType.number,
                            maxLine: 1,
                            validate: true,
                            label: "Recent Salary Status",
                            hintText: "Enter the amount here",
                          ),
                        ),
                        Gap($style.insets.sm),
                        Expanded(
                          child: CustomDropDownSearch(
                            validate: true,
                            enableController: true,
                            menuController: _textController[10],
                            label: 'Currency',
                            hintText: 'Select a Currency',
                            onSelect: (value) {
                              _textController[10].text = value?.label ?? '';
                            },
                            menu: [
                              MenuItem(0, 'INR'),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //upload container
                    Builder(
                      builder: (context) {
                        mediaFile = context.watch<FilePickerCubit>().fileBytes;
                        mediaName = context.watch<FilePickerCubit>().fileName;
                        final currentState =
                            context.watch<FilePickerCubit>().state;
                        return UploadDocumentWidget(
                          blobDir: BlobDir.workExperience,
                          currentState: currentState,
                          label: 'Add Media',
                          uploadHintText: 'Browse file',
                          onBrowse: () {
                            context.read<FilePickerCubit>().browseFile();
                          },
                          onRemove: () {
                            context.read<FilePickerCubit>().removeFile();
                          },
                        );
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
            final currentState = context.watch<WorkExperienceCubit>().state;

            return !currentState.isLoading && !currentState.isError
                ? CustomElevatedButton(
                    isLoading: currentState.isSaving,
                    buttonName: 'Save',
                    width: ElevatedButtonWidth.large,
                    onPressed: () async {
                      mediaFile ??= getIt<FilePickerCubit>().fileBytes;
                      if (mediaFile == null) {
                        context.showCustomSnackbar();
                      }
                      if (_formKey.currentState!.validate() &&
                          mediaFile != null) {
                        model = model.copyWith(
                          title: handleNullString(_textController[0]),
                          company: handleNullString(_textController[1]),
                          description: handleNullString(_textController[2]),
                          location: handleEmptyString(_textController[3]),
                          recentSalary: stringToInt(_textController[4].text),
                          currentlyWorking: statusVisibilityNotifier.value,
                          domainId: domainId,
                          startDate: convertDate(
                            _textController[5].text,
                            toReverse: true,
                          ),
                          endDate: convertDate(
                            _textController[6].text,
                            toReverse: true,
                          ),
                          employmentType: handleNullString(_textController[7]),
                          jobLevel: handleNullString(_textController[8]),
                          domain: handleNullString(_textController[9]),
                          currency: handleNullString(_textController[10]),
                        );

                        ///Updating expected salary
                        context.read<WorkExperienceCubit>().saveWorkExperience(
                              model,
                              mediaFile,
                              requestTypeHandleWithId(widget.id),
                              mediaName,
                              isEdited: isEdited,
                            );
                        isEdited = false;
                      }
                    },
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  int? _getIdByDomainName(String? domain) {
    for (var data in model.domainList ?? []) {
      if (data.domainName == domain) {
        return data.id;
      }
    }
    return null;
  }
}
