import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/core/common.dart';

import 'package:shareinfo/presentation/profile/screens/my_profile_screen.dart';
import 'package:shareinfo/presentation/widget/views/error_views/page_not_found.dart';

enum ProfilePath {
  candidateProfile,
  personalInfo,
  summary,
  expectedSalary,
  workExperience,
  education,
  projects,
  certificates,
  experience,
  professionalExam,
  awardAndAchievements,
  seminarsAndTraining,
  organizationActivities,
  languages,
  skills,
  affiliations,
  references,
  cvResume,
  academicInfo
}

///Build screen using enum
Widget parcProfileEnumToScreen(ProfilePath path, {int? id}) {
  switch (path) {
    case ProfilePath.candidateProfile:
      return const ScreenMyProfile();
    case ProfilePath.academicInfo:
      return const ScreenAcademicInformation();
    case ProfilePath.personalInfo:
      return const ScreenContactInformation();
    case ProfilePath.summary:
      return const ScreenSummary();
    case ProfilePath.expectedSalary:
      return const ScreenExpectedSalary();
    case ProfilePath.workExperience:
      return ScreenWorkExperience(id: id);
    case ProfilePath.education:
      return ScreenEducation(id: id);
    case ProfilePath.projects:
      return ScreenProject(id: id);
    case ProfilePath.certificates:
      return ScreenCertificationAndLicenses(id: id);
    case ProfilePath.experience:
      return ScreenVolunteeringExperience(id: id);
    case ProfilePath.professionalExam:
      return ScreenProfessionalsExams(id: id);
    case ProfilePath.awardAndAchievements:
      return ScreenAwardAndAchievements(id: id);
    case ProfilePath.seminarsAndTraining:
      return ScreenSeminarAndTraining(id: id);
    case ProfilePath.organizationActivities:
      return ScreenOrganizationAndActivity(id: id);
    case ProfilePath.languages:
      return ScreenLanguage(id: id);
    case ProfilePath.skills:
      return const ScreenSkills();
    case ProfilePath.affiliations:
      return ScreenAffiliations(id: id);
    case ProfilePath.references:
      return ScreenReference(id: id);
    case ProfilePath.cvResume:
      return ScreenResume(id: id);
    default:
      return const PageNotFound();
  }
}

String parcEnumToProfilePath(ProfilePath type) {
  switch (type) {
    case ProfilePath.candidateProfile:
      return '/d/my_profile';
    case ProfilePath.personalInfo:
      return '/d/personal_info';
    case ProfilePath.academicInfo:
      return '/d/academic_info';
    case ProfilePath.summary:
      return '/d/summary';
    case ProfilePath.expectedSalary:
      return '/d/expected_salary';
    case ProfilePath.workExperience:
      return '/d/work_experience';
    case ProfilePath.education:
      return '/d/education';
    case ProfilePath.projects:
      return '/d/projects';
    case ProfilePath.certificates:
      return '/d/certificates';
    case ProfilePath.experience:
      return '/d/experience';
    case ProfilePath.professionalExam:
      return '/d/professional_exam';
    case ProfilePath.awardAndAchievements:
      return '/d/award_achievements';
    case ProfilePath.seminarsAndTraining:
      return '/d/seminar_training';
    case ProfilePath.organizationActivities:
      return '/d/organization_activities';
    case ProfilePath.languages:
      return '/d/languages';
    case ProfilePath.skills:
      return '/d/skills';
    case ProfilePath.affiliations:
      return '/d/affiliations';
    case ProfilePath.references:
      return '/d/references';
    case ProfilePath.cvResume:
      return '/d/cv_resume';

    default:
      return '/d/my_profile';
  }
}

ProfilePath parcStringToProfileEnum(String value) {
  switch (value) {
    case 'my_profile':
      return ProfilePath.candidateProfile;
    case 'personal_info':
      return ProfilePath.personalInfo;
    case 'academic_info':
      return ProfilePath.academicInfo;
    case 'summary':
      return ProfilePath.summary;
    case 'expected_salary':
      return ProfilePath.expectedSalary;
    case 'work_experience':
      return ProfilePath.workExperience;
    case 'education':
      return ProfilePath.education;
    case 'projects':
      return ProfilePath.projects;
    case 'certificates':
      return ProfilePath.certificates;
    case 'experience':
      return ProfilePath.experience;
    case 'professional_exam':
      return ProfilePath.professionalExam;
    case 'award_achievements':
      return ProfilePath.awardAndAchievements;
    case 'seminar_training':
      return ProfilePath.seminarsAndTraining;
    case 'organization_activities':
      return ProfilePath.organizationActivities;
    case 'languages':
      return ProfilePath.languages;
    case 'skills':
      return ProfilePath.skills;
    case 'affiliations':
      return ProfilePath.affiliations;
    case 'references':
      return ProfilePath.references;
    case 'cv_resume':
      return ProfilePath.cvResume;
    default:
      return ProfilePath.candidateProfile;
  }
}
