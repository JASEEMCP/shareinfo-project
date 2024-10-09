import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/common/debouncer.dart';
import 'package:shareinfo/presentation/widget/custom_elevated_button.dart';
import 'package:shareinfo/presentation/widget/scrollable_tab_bar_widget.dart';
import 'package:shareinfo/presentation/widget/job_overview_widget.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class ScreenJobDetail extends StatefulWidget {
  const ScreenJobDetail({super.key, required this.jobId});

  final String jobId;
  @override
  State<ScreenJobDetail> createState() => _ScreenJobDetailState();
}

class _ScreenJobDetailState extends State<ScreenJobDetail> {
  late String path;
  @override
  void initState() {
    super.initState();
    //Get previous root and appending with applied job route
    path = appRouter.routeInformationProvider.value.uri.path;
  }

  final Debouncer _debouncerBtn = Debouncer(const Duration(milliseconds: 100));
  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<JobDetailCubit>().getJobDetail(widget.jobId);
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Builder(builder: (context) {
            final currentState = context.watch<JobDetailCubit>().state;
            final currentModel = context.watch<JobDetailCubit>().model;
            return IconButton(
              onPressed: () {
                if (currentState.isError) return;
                //Prevent user tap  button multiple time
                _debouncerBtn.call(() {
                  context.read<JobDetailCubit>().saveJob(
                        currentModel.jobId ?? '',
                      );
                });
              },
              icon: currentModel.isSaved ?? false
                  ? const Icon(Icons.bookmark)
                  : const Icon(
                      Icons.bookmark_outline,
                    ),
            );
          }),
          IconButton(
            onPressed: () {
              shareJobLink(widget.jobId);
            },
            icon: const Icon(
              Icons.share,
            ),
          ),
          Gap(inset.lg),
        ],
      ),
      body: BlocBuilder<JobDetailCubit, JobDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const CustomCircularProgressIndicatorC(),
            error: (e) => NetWorkError(
              onRefresh: () {
                context.read<JobDetailCubit>().getJobDetail(widget.jobId);
              },
            ),
            success: (model) {
              return ResponsiveWidget.isTabletScreen(context)
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: JobOverViewWidget(
                              companyLogo: model.companyLogo,
                              jobTitle: model.jobTitle,
                              companyName: model.companyName,
                              isCampus: model.isCampus,
                              instituteName: model.instituteName,
                              salaryType: model.salaryType,
                              startDate: model.recruitmentStartDate,
                              endDate: model.recruitmentEndDate,
                              location: model.location!.isEmpty
                                  ? 'N/A'
                                  : model.location?[0],
                              workingMode: model.workingMode,
                              minSalary: model.minimumSalary,
                              maxSalary: model.maximumSalary,
                              enableExpireDate: true,
                            ),
                          ),
                          //Scrollable tab bar
                          NonScrollableTabBarWidget(
                            qualificationListStudent:
                                model.requiredQualities ?? [],
                            isCampus: model.isCampus,
                            jobDescriptionList: model.jobDescription ?? [],
                            qualificationList: model.minQualification ?? [],
                            benefitsList: model.perksBenefits ?? [],
                            skillList: model.requiredSkills ?? [],
                            jobLevel: model.jobLevel,
                            educational: model.educationalQualification,
                            experience: model.experienceType,
                            jobCategory: model.jobCategory,
                            referencedWebsite: model.referenceWebsite,
                            companyWebsite: model.companyWebsite,
                            vacancy: model.noOfVacancies,
                            domain: model.domain,
                            cgpa: model.minCgpa,
                            supportMail: model.supportMail,
                            backlogs: model.backPapers,
                          ),
                          //Elevated bottom
                          Center(
                            child: Visibility(
                              visible: !(model.isApplied ?? false),
                              replacement: Padding(
                                padding: customPaddingBottom(),
                                child: CustomElevatedButton(
                                  buttonName: 'View in My Application',
                                  width: ElevatedButtonWidth.custom,
                                  onPressed: () {
                                    context.go(
                                        ScreenPath.applicationStatusDetail(
                                            model.jobId ?? ''));
                                  },
                                ),
                              ),
                              child: Padding(
                                padding: customPaddingBottom(),
                                child: CustomElevatedButton(
                                  buttonName: "Apply now !",
                                  width: ElevatedButtonWidth.custom,
                                  onPressed: () {
                                    _buildApplyJobButton(context,
                                        model.isCampus!, model.jobId ?? '');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ///Job card detail view
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Center(
                                child: JobOverViewWidget(
                                  companyLogo: model.companyLogo,
                                  jobTitle: model.jobTitle,
                                  companyName: model.companyName,
                                  isCampus: model.isCampus,
                                  instituteName: model.instituteName,
                                  salaryType: model.salaryType,
                                  startDate: model.recruitmentStartDate,
                                  endDate: model.recruitmentEndDate,
                                  location: model.location!.isEmpty
                                      ? 'N/A'
                                      : model.location?[0],
                                  workingMode: model.workingMode,
                                  minSalary: model.minimumSalary,
                                  maxSalary: model.maximumSalary,
                                  enableExpireDate: true,
                                ),
                              ),
                              //Elevated bottom
                              Center(
                                child: Visibility(
                                  visible: !(model.isApplied ?? false),
                                  replacement: Padding(
                                    padding: customPaddingBottom(),
                                    child: CustomElevatedButton(
                                      buttonName: 'View in My Application',
                                      width: ElevatedButtonWidth.custom,
                                      onPressed: () {
                                        context.go(
                                            ScreenPath.applicationStatusDetail(
                                                model.jobId ?? ''));
                                      },
                                    ),
                                  ),
                                  child: Padding(
                                    padding: customPaddingBottom(),
                                    child: CustomElevatedButton(
                                      buttonName: "Apply now !",
                                      width: ElevatedButtonWidth.custom,
                                      onPressed: () {
                                        _buildApplyJobButton(context,
                                            model.isCampus!, model.jobId ?? '');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Scrollable tab bar
                        Expanded(
                          child: ScrollableTabBarWidget(
                            qualificationListStudent:
                                model.requiredQualities ?? [],
                            isCampus: model.isCampus,
                            jobDescriptionList: model.jobDescription ?? [],
                            qualificationList: model.minQualification ?? [],
                            benefitsList: model.perksBenefits ?? [],
                            skillList: model.requiredSkills ?? [],
                            jobLevel: model.jobLevel,
                            educational: model.educationalQualification,
                            experience: model.experienceType,
                            jobCategory: model.jobCategory,
                            referencedWebsite: model.referenceWebsite,
                            companyWebsite: model.companyWebsite,
                            vacancy: model.noOfVacancies,
                            domain: model.domain,
                            cgpa: model.minCgpa,
                            supportMail: model.supportMail,
                            backlogs: model.backPapers,
                          ),
                        ),
                      ],
                    );
            },
          );
        },
      ),
    );
  }

  Future<dynamic> _buildApplyJobButton(
      BuildContext context, bool isCampus, String jobId) {
    final inset = $style.insets;
    return showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxHeight: 200, maxWidth: 100 * context.w),
      builder: (context) {
        return Column(
          children: [
            Gap(inset.sm),
            Text(
              'Apply Job',
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(1),
              style: $style.text.textBold18.copyWith(
                color: context.theme.shareinfoBlue,
              ),
            ),
            Gap(inset.sm),
            Divider(
              color: context.theme.shareinfoGreyLite,
              indent: inset.md,
              endIndent: inset.md,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: inset.md,
                left: inset.md,
                right: inset.md,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.pop();
                        applyJobModel =
                            ApplyJobModel(jobId: jobId, isCampus: isCampus);

                        context.go(ScreenPath.applyProfile(path));
                      },
                      style: ButtonStyle(
                        maximumSize: WidgetStatePropertyAll(
                            Size(context.w * 45, inset.offset)),
                        minimumSize: WidgetStatePropertyAll(
                            Size(context.w * 40, inset.offset)),
                        backgroundColor: WidgetStatePropertyAll(
                            context.theme.shareinfoLightBlue),
                      ),
                      child: Text(
                        'Apply with Profile',
                        textAlign: TextAlign.center,
                        style: $style.text.textBold14.copyWith(
                          color: context.theme.shareinfoWhite,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
