import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shareinfo/application/auth/profile_submission_cubit/student_profile_submission_cubit.dart';
import 'package:shareinfo/application/happening/event_occurred_cubit/event_occurred_cubit.dart';
import 'package:shareinfo/application/happening/event_preview_cubit/event_preview_cubit.dart';
import 'package:shareinfo/application/happening/event_register_cubit/event_register_cubit.dart';
import 'package:shareinfo/application/happening/feedback_submission_cubit/feedback_submission_cubit.dart';
import 'package:shareinfo/application/happening/happening_detail_cubit/happening_detail_cubit.dart';
import 'package:shareinfo/application/happening/happening_list_cubit/happening_list_cubit.dart';
import 'package:shareinfo/application/happening/registered_event_cubit/registered_event_cubit.dart';
import 'package:shareinfo/application/happening/saved_happening_cubit/saved_happening_cubit.dart';
import 'package:shareinfo/application/practice/enroll_practice_cubit/enroll_practice_cubit.dart';
import 'package:shareinfo/application/practice/enrolled_practice_list_cubit/enrolled_practice_list_cubit.dart';
import 'package:shareinfo/application/practice/enrolled_process_list_cubit/enrolled_process_list_cubit.dart';
import 'package:shareinfo/application/practice/leaderboards_list_cubit/leaderboards_list_cubit.dart';
import 'package:shareinfo/application/practice/practice_detail_cubit/practice_detail_cubit.dart';
import 'package:shareinfo/application/practice/practice_list_cubit/practice_list_cubit.dart';
import 'package:shareinfo/application/practice/specific_practice_leaderboards_cubit/specific_practice_leaderboards_list_cubit.dart';
import 'package:shareinfo/application/profile/cv_resume_cubit.dart/update_cv_resume_cubit.dart';
import 'package:shareinfo/application/settings/profile_completion_rate_cubit/profile_completion_rate_cubit.dart';

import 'package:shareinfo/core/provider_libs.dart';
// ignore: depend_on_referenced_packages
import 'package:nested/nested.dart';

class RegisterCubits {
  List<SingleChildWidget> register() {
    return [
      /*Auth providers */
      BlocProvider(create: (context) => getIt<TokenCubit>()),
      BlocProvider(create: (context) => getIt<LoginCubit>()),
      BlocProvider(create: (context) => getIt<ForgotPwdCubit>()),
      BlocProvider(create: (context) => getIt<ResendOtpCubit>()),
      BlocProvider(create: (context) => getIt<ProfileSubmissionCubit>()),
      BlocProvider(create: (context) => getIt<StudentProfileSubmissionCubit>()),
      BlocProvider(create: (context) => getIt<InstituteListCubit>()),
      BlocProvider(create: (context) => getIt<AspirationListCubit>()),
      BlocProvider(create: (context) => getIt<DepartmentListCubit>()),
      /*Common providers*/
      BlocProvider(create: (context) => getIt<ImagePickerCubit>()),
      BlocProvider(create: (context) => getIt<FilePickerCubit>()),
      /*Profile providers*/
      BlocProvider(create: (context) => getIt<PersonalInfoCubit>()),
      BlocProvider(create: (context) => getIt<ProfileBloc>()),
      BlocProvider(create: (context) => getIt<CandidateProfileBloc>()),
      BlocProvider(create: (context) => getIt<ExpectedSalaryCubit>()),
      BlocProvider(create: (context) => getIt<CvResumeCubit>()),
      BlocProvider(create: (context) => getIt<UpdateCvResumeCubit>()),
      BlocProvider(create: (context) => getIt<WorkExperienceCubit>()),
      BlocProvider(create: (context) => getIt<EducationCubit>()),
      BlocProvider(create: (context) => getIt<ProjectCubit>()),
      BlocProvider(create: (context) => getIt<CertificateCubit>()),
      BlocProvider(create: (context) => getIt<VolunteeringExperienceCubit>()),
      BlocProvider(create: (context) => getIt<ProfessionalExamCubit>()),
      BlocProvider(create: (context) => getIt<AwardAchievementCubit>()),
      BlocProvider(create: (context) => getIt<SeminarTrainingCubit>()),
      BlocProvider(create: (context) => getIt<OrganizationActivitiesCubit>()),
      BlocProvider(create: (context) => getIt<AffiliationsCubit>()),
      BlocProvider(create: (context) => getIt<ReferencesCubit>()),
      BlocProvider(create: (context) => getIt<LanguageCubit>()),
      BlocProvider(create: (context) => getIt<SkillsCubit>()),
      BlocProvider(create: (context) => getIt<AcademicInfoCubit>()),
      /*Job providers*/
      BlocProvider(create: (context) => getIt<JobListCubit>()),
      BlocProvider(create: (context) => getIt<CampusJobCubit>()),
      BlocProvider(create: (context) => getIt<SavedJobsCubit>()),
      BlocProvider(create: (context) => getIt<AppliedJobCubit>()),
      BlocProvider(create: (context) => getIt<JobDetailCubit>()),
      BlocProvider(create: (context) => getIt<AppliedJobDetailCubit>()),
      BlocProvider(create: (context) => getIt<ApplyJobCubit>()),
      /*Home providers*/
      BlocProvider(create: (context) => getIt<HomeCubit>()),
      BlocProvider(create: (context) => getIt<HomeSearchCubit>()),
      BlocProvider(create: (context) => getIt<SuggestedListCubit>()),
      BlocProvider(create: (context) => getIt<NotificationCubit>()),
      /*Practice providers*/
      BlocProvider(create: (context) => getIt<PracticeListCubit>()),
      BlocProvider(create: (context) => getIt<PracticeDetailCubit>()),
      BlocProvider(create: (context) => getIt<EnrollPracticeCubit>()),
      BlocProvider(create: (context) => getIt<EnrolledPracticeListCubit>()),
      BlocProvider(create: (context) => getIt<EnrolledProcessListCubit>()),
      //BlocProvider(create: (context) => getIt<SpecificEnrolledProcessCubit>()),
      BlocProvider(create: (context) => getIt<LeaderboardsListCubit>()),
      BlocProvider(
          create: (context) => getIt<SpecificPracticeLeaderboardsListCubit>()),
      /*Happening providers*/
      BlocProvider(create: (context) => getIt<HappeningListCubit>()),
      BlocProvider(create: (context) => getIt<RegisteredEventCubit>()),
      BlocProvider(create: (context) => getIt<EventOccurredCubit>()),
      BlocProvider(create: (context) => getIt<SavedHappeningCubit>()),
      BlocProvider(create: (context) => getIt<HappeningDetailCubit>()),
      BlocProvider(create: (context) => getIt<EventRegisterCubit>()),
      BlocProvider(create: (context) => getIt<EventPreviewCubit>()),
      BlocProvider(create: (context) => getIt<FeedbackSubmissionCubit>()),
      /*Settings providers*/
      BlocProvider(create: (context) => getIt<ResetPasswordCubit>()),
      BlocProvider(create: (context) => getIt<DeactivateAccountCubit>()),
      BlocProvider(create: (context) => getIt<PersonalInfoSettingCubit>()),
      BlocProvider(create: (context) => getIt<DeleteAccountCubit>()),
      BlocProvider(create: (context) => getIt<ProfileCompletionRateCubit>()),
    ];
  }
}
