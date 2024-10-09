import 'package:shareinfo/core/launch_url.dart';
import 'package:shareinfo/core/profile_path.dart';
import 'package:shareinfo/domain/profile/model/profile_model/profile_model.dart';
import 'package:shareinfo/presentation/core/assets.dart';
import 'package:shareinfo/presentation/profile/widget/template_widget.dart';
import 'package:shareinfo/presentation/widget/pdf_loaded_widget.dart';
import 'package:shareinfo/presentation/core/common.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

class CategorizedProfileWidget extends StatelessWidget {
  const CategorizedProfileWidget({
    super.key,
    this.profileModel,
    this.onTap,
    // required this.currentPath,
    this.validate = false,
  });
  final Function? onTap;
  final ProfileModel? profileModel;
  final bool? validate;
  //appending current path in profile categorized screen
  //final String currentPath;
  String appendingDateDifference(String? from, String? to) {
    if (to == null) {
      return '${Date.mmmmy(from).toBlankSeparator} - Present';
    }
    return '${Date.mmmmy(from).toBlankSeparator} - ${Date.mmmmy(to).toBlankSeparator} (${Date.difference(from, to).countWithText ?? 'N/A'})';
  }

  @override
  Widget build(BuildContext context) {
    final inset = $style.insets;
    final p = profileModel;
    final personalInfo = p?.personalInformation;
    final expectedSalary = p?.expectedSalary;
    final workExperienceList = p?.workExperienceSet;
    final educationList = p?.educationSet;
    final projectList = p?.projectSet;
    final certificateList = p?.certificationSet;
    final experienceList = p?.volunteeringExperienceSet;
    final profExamList = p?.professionalExamSet;
    final awardAchievementList = p?.awardsAchievementSet;
    final seminarTrainingList = p?.seminarTrainingSet;
    final organizationList = p?.organizationActivitiesSet;
    final languageList = p?.languageSet;
    final skillList = p?.skillSet;
    final affiliationList = p?.affiliationSet;
    final referencesList = p?.referencesSet;
    final cvList = p?.cvResumeSet;
    final currentInstitute = p?.currentinstitute;
    final field = p?.unCompletedField;

    /// Updating profile pic

    auth.authInfo.value = auth.authInfo.value.copyWith(
      profilePhoto: p?.profilePic,
    );

    final profileItemList = [
      ///personal information
      InteractiveTouchBehaviorWidget(
        onTap: () {
          onTap != null ? onTap!() : null;
        },
        path: ProfilePath.personalInfo,
        child: CustomProfileTemplate(
          enableErrorBorder: validate! && !field!.isPersonalInformationFilled!,
          text: 'Personal Information',
          leadingIcon: Icon(
            Icons.account_circle,
            color: context.theme.imiotDarkPurple,
          ),
          isEmpty: personalInfo == null,
          child: Column(
            children: [
              //User address
              personalInfo?.address != null
                  ? ProfileTemplateType1(
                      icon: Icons.home,
                      data: personalInfo?.address?.toTitleCase() ?? 'N/A',
                    )
                  : const SizedBox.shrink(),
              //User dob
              personalInfo?.dob != null && personalInfo?.gender != null
                  ? ProfileTemplateType1(
                      icon: Icons.calendar_month,
                      data:
                          "${Date.mmmmy(personalInfo?.dob).toBlankSeparator} (${personalInfo?.gender ?? 'N/A'})",
                    )
                  : const SizedBox.shrink(),
              //Phone number
              ProfileTemplateType1(
                icon: Icons.phone_android,
                data: personalInfo?.phoneNo ?? 'N/A',
              ),
              //Email
              ProfileTemplateType1(
                icon: Icons.mark_email_read,
                data: personalInfo?.email,
              ),
            ],
          ),
        ),
      ),

      ///Academic information
      currentInstitute != null
          ? InteractiveTouchBehaviorWidget(
              onTap: () {
                onTap != null ? onTap!() : null;
              },
              path: ProfilePath.academicInfo,
              child: CustomProfileTemplate(
                enableErrorBorder:
                    validate! && !field!.isCurrentInstituteFilled!,
                text: 'Academic Information',
                leadingIcon: Icon(
                  Icons.school,
                  color: context.theme.imiotDarkPurple,
                ),
                isEmpty: personalInfo == null,
                child: Column(
                  children: [
                    //Institute name
                    currentInstitute.currentInstitute != null
                        ? ProfileTemplateType1(
                            icon: Icons.corporate_fare,
                            data: currentInstitute.currentInstitute
                                    ?.toTitleCase() ??
                                'N/A',
                          )
                        : const SizedBox.shrink(),
                    //Stream
                    currentInstitute.stream != null
                        ? ProfileTemplateType1(
                            icon: Icons.dns,
                            data:
                                currentInstitute.stream?.toTitleCase() ?? 'N/A',
                          )
                        : const SizedBox.shrink(),
                    //Academic year range
                    currentInstitute.startDate != null
                        ? ProfileTemplateType1(
                            icon: Icons.hourglass_bottom,
                            data:
                                '${currentInstitute.startDate} - ${currentInstitute.endDate}',
                          )
                        : const SizedBox.shrink(),
                    //Semester
                    currentInstitute.currentSemester != null
                        ? ProfileTemplateType1(
                            icon: Icons.incomplete_circle,
                            data:
                                'Semester ${currentInstitute.currentSemester}',
                          )
                        : const SizedBox.shrink(),
                    //Cgpa and scale
                    currentInstitute.cgpa != null
                        ? ProfileTemplateType1(
                            icon: Icons.data_exploration_outlined,
                            data:
                                '${currentInstitute.cgpa} out of ${currentInstitute.scale}',
                          )
                        : const SizedBox.shrink(),
                    //Backlogs
                    currentInstitute.backlogs != null
                        ? ProfileTemplateType1(
                            icon: Icons.rule,
                            data: '${currentInstitute.backlogs} Backlogs',
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),

      /// Summary
      InteractiveTouchBehaviorWidget(
        onTap: () {
          onTap != null ? onTap!() : null;
        },
        path: ProfilePath.summary,
        child: CustomProfileTemplate(
          suffixIconPressed: () {
            context.go(ScreenPath.profilePath(ProfilePath.summary));
          },
          text: 'Summary',
          isEmpty: p?.summary?.summaryTxt == null,
          leadingIcon: Icon(
            Icons.format_list_bulleted,
            color: context.theme.imiotDarkPurple,
          ),
          child: Text(
            p?.summary?.summaryTxt ?? 'N/A',
            maxLines: 5,
            textAlign: TextAlign.start,
            style: $style.text.textSBold12.copyWith(
              overflow: TextOverflow.ellipsis,
              color: context.theme.shareinfoTextDark,
            ),
          ),
        ),
      ),

      /// Expected salary
      InteractiveTouchBehaviorWidget(
        onTap: () {
          onTap != null ? onTap!() : null;
        },
        path: ProfilePath.expectedSalary,
        child: CustomProfileTemplate(
          suffixIconPressed: () {
            context.go(ScreenPath.profilePath(ProfilePath.expectedSalary));
          },
          text: 'Expected Salary',
          isEmpty: expectedSalary?.maximumFulltime == null,
          leadingIcon: Icon(
            Icons.pie_chart,
            color: context.theme.imiotDarkPurple,
          ),
          child: Row(
            children: [
              Text(
                '₹ ${expectedSalary?.maximumFulltime != null ? getSalaryToLpa(expectedSalary?.maximumFulltime) : 'N/A'} LPA - Full Time',
                textScaler: const TextScaler.linear(1),
                style: $style.text.textSBold10.copyWith(
                  overflow: TextOverflow.ellipsis,
                  color: context.theme.shareinfoTextDark,
                ),
              ),
              Expanded(
                child: Text(
                  ' (only you can use this)',
                  textScaler: const TextScaler.linear(1),
                  style: $style.text.textSBold10.copyWith(
                    color: context.theme.shareinfoTextDark,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /// work experience
      CustomProfileTemplate(
        isEmpty: workExperienceList!.isEmpty,
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.workExperience,
          ));
          onTap != null ? onTap!() : null;
        },
        enableAddIcon: true,
        disablePadding: true,
        text: 'Work Experience',
        leadingIcon: Icon(
          Icons.business_center,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in workExperienceList)
              ProfileTemplateType2(
                logoPath: ImagePaths.workExpIcon,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.workExperience,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.title ?? 'N/A',
                subtitle: data.company ?? 'N/A',
                subtitle1:
                    appendingDateDifference(data.startDate, data.endDate),
                subtitle3: "",
              ),
          ],
        ),
      ),

      /// Education
      CustomProfileTemplate(
        enableErrorBorder: validate! && !field!.isEducationFilled!,
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(ProfilePath.education));
          onTap != null ? onTap!() : null;
        },
        isEmpty: educationList!.isEmpty,
        enableAddIcon: true,
        disablePadding: true,
        text: 'Education',
        leadingIcon: Icon(
          Icons.history_edu,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in educationList)
              ProfileTemplateType3(
                logoPath: ImagePaths.educationLogo,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.education,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.course ?? 'N/A',
                subtitle: data.institute ?? 'N/A',
                subtitle1:
                    appendingDateDifference(data.startDate, data.endDate),
                subtitle2: 'GPA : ${data.gpa} (${data.scale} Scale)',
              ),
          ],
        ),
      ),

      /// Projects
      CustomProfileTemplate(
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.projects,
          ));
          onTap != null ? onTap!() : null;
        },
        text: 'Projects',
        enableAddIcon: true,
        isEmpty: projectList!.isEmpty,
        disablePadding: true,
        leadingIcon: Icon(
          Icons.account_tree,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in projectList)
              ProfileTemplateType4(
                logoPath: ImagePaths.projectLogo,
                onChipPressed: () {
                  openWeb(data.projectUrl ?? '');
                },
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.projects,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.programName ?? 'N/A',
                subtitle: data.role ?? 'N/A',
                text: appendingDateDifference(data.startDate, data.endDate),
                chipText: 'Show Project',
                chipIcon: Icons.near_me,
              ),
          ],
        ),
      ),

      ///Certification and Licenses
      CustomProfileTemplate(
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.certificates,
          ));
          onTap != null ? onTap!() : null;
        },
        enableAddIcon: true,
        disablePadding: true,
        isEmpty: certificateList!.isEmpty,
        text: 'Certification and Licenses ',
        leadingIcon: Icon(
          Icons.workspace_premium,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in certificateList)
              ProfileTemplateType5(
                logoPath: ImagePaths.certificateLogo,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.certificates,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.name ?? 'N/A',
                subtitle: data.issuingOrganization ?? 'N/A',
                subtitle1: '${Date.mmmmy(data.issueDate).toBlankSeparator}',
              ),
          ],
        ),
      ),

      ///Volunteer Experience
      CustomProfileTemplate(
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.experience,
          ));
          onTap != null ? onTap!() : null;
        },
        enableAddIcon: true,
        disablePadding: true,
        isEmpty: experienceList!.isEmpty,
        text: 'Volunteering Experience',
        leadingIcon: Icon(
          Icons.group_outlined,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in experienceList)
              ProfileTemplateType2(
                logoPath: ImagePaths.volunteerIcon,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.experience,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.title ?? 'N/A',
                subtitle: data.organization ?? 'N/A',
                subtitle1:
                    appendingDateDifference(data.startDate, data.endDate),
                subtitle3: "",
              ),
          ],
        ),
      ),

      /// Professional Exam
      CustomProfileTemplate(
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.professionalExam,
          ));
          onTap != null ? onTap!() : null;
        },
        enableAddIcon: true,
        disablePadding: true,
        text: 'Professional Exam',
        isEmpty: profExamList!.isEmpty,
        leadingIcon: Icon(
          Icons.document_scanner,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in profExamList)
              ProfileTemplateType5(
                logoPath: ImagePaths.profExamIcon,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.professionalExam,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.title ?? 'N/A',
                subtitle: '${data.score}/${data.scale}',
                subtitle1: '${Date.mmmmy(data.dateOfIssue).toBlankSeparator}',
              ),
          ],
        ),
      ),

      //Awards and Achievements
      CustomProfileTemplate(
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.awardAndAchievements,
          ));
          onTap != null ? onTap!() : null;
        },
        enableAddIcon: true,
        isEmpty: awardAchievementList!.isEmpty,
        disablePadding: true,
        text: 'Awards and Achievements',
        leadingIcon: Icon(
          Icons.new_releases,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in awardAchievementList)
              ProfileTemplateType5(
                logoPath: ImagePaths.awardIcon,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.awardAndAchievements,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.topic ?? 'N/A',
                subtitle: data.organisation ?? 'N/A',
                subtitle1: '${Date.mmmmy(data.dateConducted).toBlankSeparator}',
              ),
          ],
        ),
      ),

      ///Seminar and Trainings
      CustomProfileTemplate(
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.seminarsAndTraining,
          ));
          onTap != null ? onTap!() : null;
        },
        enableAddIcon: true,
        disablePadding: true,
        isEmpty: seminarTrainingList!.isEmpty,
        text: 'Seminars and Trainings',
        leadingIcon: Icon(
          Icons.data_exploration,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in seminarTrainingList)
              ProfileTemplateType5(
                logoPath: ImagePaths.seminarLang,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.seminarsAndTraining,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.title ?? 'N/A',
                subtitle: data.organisation ?? 'N/A',
                subtitle1: '${Date.mmmmy(data.date).toBlankSeparator}',
              ),
          ],
        ),
      ),

      /// Organization activities
      CustomProfileTemplate(
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.organizationActivities,
          ));
          onTap != null ? onTap!() : null;
        },
        isEmpty: organizationList!.isEmpty,
        enableAddIcon: true,
        disablePadding: true,
        text: 'Organization Activities',
        leadingIcon: Icon(
          Icons.diversity_3,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in organizationList)
              ProfileTemplateType2(
                logoPath: ImagePaths.orgActivityIcon,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.organizationActivities,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.organization ?? 'N/A',
                subtitle: data.role ?? 'N/A',
                subtitle1: appendingDateDifference(data.fromDate, data.toDate),
                subtitle3: "",
              ),
          ],
        ),
      ),

      ///Languages
      CustomProfileTemplate(
        enableErrorBorder: validate! && !field!.isLanguageFilled!,
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.languages,
          ));
          onTap != null ? onTap!() : null;
        },
        enableAddIcon: true,
        disablePadding: true,
        isEmpty: languageList!.isEmpty,
        text: 'Languages',
        leadingIcon: Icon(
          Icons.language,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in languageList)
              ProfileTemplateType5(
                logoPath: ImagePaths.languageIcon,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.languages,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.language?.toTitleCase() ?? 'N/A',
                subtitle: data.proficiency?.toTitleCase() ?? 'N/A',
              ),
          ],
        ),
      ),

      ///Skills
      InteractiveTouchBehaviorWidget(
        onTap: () {
          onTap != null ? onTap!() : null;
        },
        path: ProfilePath.skills,
        child: CustomProfileTemplate(
          enableErrorBorder: validate! && !field!.isSkillFilled!,
          suffixIconPressed: () {
            context.go(ScreenPath.profilePath(
              ProfilePath.skills,
            ));
          },
          text: 'Skills',
          leadingIcon: Icon(
            Icons.psychology,
            color: context.theme.imiotDarkPurple,
          ),
          isEmpty: skillList!.isEmpty,
          child: Column(
            children: [
              Wrap(
                spacing: inset.xs,
                runSpacing: inset.xs,
                children: [
                  for (var data in skillList)
                    CustomChip(
                      label: data.skill?.toTitleCase() ?? 'N/A',
                    ),
                ],
              ),
            ],
          ),
        ),
      ),

      ///Affiliations
      CustomProfileTemplate(
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.affiliations,
          ));
          onTap != null ? onTap!() : null;
        },
        enableAddIcon: true,
        disablePadding: true,
        isEmpty: affiliationList!.isEmpty,
        text: 'Affiliations',
        leadingIcon: Icon(
          Icons.published_with_changes,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in affiliationList)
              ProfileTemplateType2(
                logoPath: ImagePaths.affiliationIcon,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.affiliations,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.organization ?? 'N/A',
                subtitle: data.role ?? 'N/A',
                subtitle1: appendingDateDifference(data.fromDate, data.toDate),
                subtitle3: "",
              ),
          ],
        ),
      ),

      ///Reference
      CustomProfileTemplate(
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.references,
          ));
          onTap != null ? onTap!() : null;
        },
        enableAddIcon: true,
        disablePadding: true,
        isEmpty: referencesList!.isEmpty,
        text: 'References',
        leadingIcon: Icon(
          Icons.admin_panel_settings,
          color: context.theme.imiotDarkPurple,
        ),
        child: Column(
          children: [
            for (var data in referencesList)
              ProfileTemplateType3(
                logoPath: ImagePaths.referencesIcon,
                onTap: () {
                  context.go(
                    ScreenPath.profilePathWithId(
                      ProfilePath.references,
                      data.id!,
                    ),
                  );
                  onTap != null ? onTap!() : null;
                },
                title: data.name ?? 'N/A',
                subtitle: data.role ?? 'N/A',
                subtitle3: data.organization ?? 'N/A',
                subtitle1: data.email ?? 'N/A',
                subtitle2: data.phoneNo ?? 'N/A',
              ),
          ],
        ),
      ),

      /// Resume/ Cv
      CustomProfileTemplate(
        enableErrorBorder: validate! && !field!.isCvResumeFilled!,
        isEmpty: cvList!.isEmpty,
        suffixIconPressed: () {
          context.go(ScreenPath.profilePath(
            ProfilePath.cvResume,
          ));
          onTap != null ? onTap!() : null;
        },
        disablePadding: true,
        enableAddIcon: true,
        text: 'CV/Resume',
        leadingIcon: Icon(
          Icons.badge,
          color: context.theme.imiotDarkPurple,
        ),
        child: Padding(
          padding: EdgeInsets.all(inset.sm),
          child: Column(
            children: [
              for (var data in cvList)
                Padding(
                  padding: EdgeInsets.only(bottom: inset.sm),
                  child: PdfLoadedSkeltonWidgetDemo(
                    documentName: data.mediaName ?? 'no-label',
                    fileSize: '',
                    onTap: () {
                      context.go(
                        ScreenPath.profilePathWithId(
                          ProfilePath.cvResume,
                          data.id!,
                        ),
                      );
                      onTap != null ? onTap!() : null;
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    ];
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: profileItemList.length,
      separatorBuilder: (context, index) => const Gap(8),
      itemBuilder: (ctx, index) {
        return profileItemList[index];
      },
    );
  }
}

class InteractiveTouchBehaviorWidget extends StatelessWidget {
  const InteractiveTouchBehaviorWidget({
    super.key,
    required this.child,
    required this.path,
    this.onTap,
    //required this.currentPath,
  });
  final Widget child;
  final ProfilePath path;
  final Function? onTap;
  //final String currentPath;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          context.go(
            ScreenPath.profilePath(path),
          );
          onTap != null ? onTap!() : () {};
        },
        child: child,
      ),
    );
  }
}