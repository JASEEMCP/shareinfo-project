// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../application/auth/aspiration_list_cubit/aspiration_list_cubit.dart'
    as _i83;
import '../../application/auth/department_list_cubit/department_list_cubit.dart'
    as _i629;
import '../../application/auth/forgot_pwd_cubit/forgot_pwd_cubit.dart' as _i858;
import '../../application/auth/institute_list_cubit/institute_list_cubit.dart'
    as _i560;
import '../../application/auth/login_cubit/login_cubit.dart' as _i103;
import '../../application/auth/profile_submission_cubit/profile_submission_cubit.dart'
    as _i484;
import '../../application/auth/profile_submission_cubit/student_profile_submission_cubit.dart'
    as _i256;
import '../../application/auth/resend_otp_cubit/resend_otp_cubit.dart'
    as _i1009;
import '../../application/auth/token_cubit/token_cubit.dart' as _i346;
import '../../application/common/file_picker_cubit/file_picker_cubit.dart'
    as _i891;
import '../../application/common/image_picker_cubit/image_picker_cubit.dart'
    as _i353;
import '../../application/common/notification_cubit/notification_cubit.dart'
    as _i224;
import '../../application/happening/event_occurred_cubit/event_occurred_cubit.dart'
    as _i127;
import '../../application/happening/event_preview_cubit/event_preview_cubit.dart'
    as _i935;
import '../../application/happening/event_register_cubit/event_register_cubit.dart'
    as _i825;
import '../../application/happening/feedback_submission_cubit/feedback_submission_cubit.dart'
    as _i419;
import '../../application/happening/happening_detail_cubit/happening_detail_cubit.dart'
    as _i873;
import '../../application/happening/happening_list_cubit/happening_list_cubit.dart'
    as _i353;
import '../../application/happening/registered_event_cubit/registered_event_cubit.dart'
    as _i349;
import '../../application/happening/saved_happening_cubit/saved_happening_cubit.dart'
    as _i32;
import '../../application/home/home_cubit/home_cubit.dart' as _i621;
import '../../application/home/home_search_cubit/home_search_cubit.dart'
    as _i868;
import '../../application/home/suggested_list_cubit/suggested_list_cubit.dart'
    as _i681;
import '../../application/job/applied_job_cubit/applied_job_cubit.dart'
    as _i849;
import '../../application/job/applied_job_detail_cubit/applied_job_detail_cubit.dart'
    as _i864;
import '../../application/job/apply_job_cubit/apply_job_cubit.dart' as _i373;
import '../../application/job/campus_job_cubit/campus_job_cubit.dart' as _i450;
import '../../application/job/job_detail_cubit/job_detail_cubit.dart' as _i462;
import '../../application/job/job_list_cubit/job_list_cubit.dart' as _i338;
import '../../application/job/saved_jobs_cubit/saved_jobs_cubit.dart' as _i107;
import '../../application/practice/enroll_practice_cubit/enroll_practice_cubit.dart'
    as _i599;
import '../../application/practice/enrolled_practice_list_cubit/enrolled_practice_list_cubit.dart'
    as _i315;
import '../../application/practice/enrolled_process_list_cubit/enrolled_process_list_cubit.dart'
    as _i13;
import '../../application/practice/leaderboards_list_cubit/leaderboards_list_cubit.dart'
    as _i130;
import '../../application/practice/practice_detail_cubit/practice_detail_cubit.dart'
    as _i929;
import '../../application/practice/practice_list_cubit/practice_list_cubit.dart'
    as _i847;
import '../../application/practice/specific_practice_leaderboards_cubit/specific_practice_leaderboards_list_cubit.dart'
    as _i911;
import '../../application/profile/academic_info_cubit/academic_info_cubit.dart'
    as _i150;
import '../../application/profile/affiliation_cubit/affiliations_cubit.dart'
    as _i455;
import '../../application/profile/award_achievement_cubit/award_achievement_cubit.dart'
    as _i864;
import '../../application/profile/candidate_profile_bloc/candidate_profile_bloc.dart'
    as _i426;
import '../../application/profile/certificate_cubit/certificate_cubit.dart'
    as _i304;
import '../../application/profile/cv_resume_cubit.dart/cv_resume_cubit.dart'
    as _i328;
import '../../application/profile/cv_resume_cubit.dart/update_cv_resume_cubit.dart'
    as _i1027;
import '../../application/profile/education_cubit/education_cubit.dart'
    as _i886;
import '../../application/profile/expected_salary_cubit/expected_salary_cubit.dart'
    as _i930;
import '../../application/profile/language_cubit/language_cubit.dart' as _i956;
import '../../application/profile/organization_activity_cubit/organization_activities_cubit.dart'
    as _i447;
import '../../application/profile/personal_info_cubit/personal_info_cubit.dart'
    as _i992;
import '../../application/profile/professional_exam/professional_exam_cubit.dart'
    as _i481;
import '../../application/profile/profile_bloc/profile_bloc.dart' as _i1036;
import '../../application/profile/project_cubit/project_cubit.dart' as _i143;
import '../../application/profile/references_cubit/references_cubit.dart'
    as _i233;
import '../../application/profile/seminar_training_cubit/seminar_training_cubit.dart'
    as _i755;
import '../../application/profile/skill_cubit/skills_cubit.dart' as _i1022;
import '../../application/profile/volunteering-experience_cubit/volunteering_experience_cubit.dart'
    as _i972;
import '../../application/profile/work_experience_cubit/work_experience_cubit.dart'
    as _i848;
import '../../application/settings/deactivate_account/deactivate_account_cubit.dart'
    as _i552;
import '../../application/settings/delete_account/delete_account_cubit.dart'
    as _i642;
import '../../application/settings/personal_info_cubit/personal_info_cubit.dart'
    as _i411;
import '../../application/settings/profile_completion_rate_cubit/profile_completion_rate_cubit.dart'
    as _i106;
import '../../application/settings/reset_password_cubit/reset_password_cubit.dart'
    as _i897;
import '../../core/provider_libs.dart' as _i986;
import '../../infrastructure/auth/auth_info.dart' as _i957;
import '../../infrastructure/auth/auth_repo.dart' as _i786;
import '../../infrastructure/auth/forgot_pwd_repo.dart' as _i554;
import '../../infrastructure/auth/pre_profile_repo.dart' as _i32;
import '../../infrastructure/common/storage_repo.dart' as _i614;
import '../../infrastructure/happening/happening_repo.dart' as _i41;
import '../../infrastructure/home/home_repo.dart' as _i271;
import '../../infrastructure/job/applied_job_repo.dart' as _i921;
import '../../infrastructure/job/job_repo.dart' as _i493;
import '../../infrastructure/practice/leaderboards_repo.dart' as _i493;
import '../../infrastructure/practice/practice_repo.dart' as _i544;
import '../../infrastructure/profile/profile_repo.dart' as _i1008;
import '../../infrastructure/profile/profile_repo_2.dart' as _i839;
import '../../infrastructure/profile/profile_repo_3.dart' as _i834;
import '../../infrastructure/profile/profile_repo_4.dart' as _i70;
import '../../infrastructure/profile/profile_repo_5.dart' as _i392;
import '../../infrastructure/profile/settings_repo.dart' as _i665;
import '../app_logic.dart' as _i45;
import '../auth/service/auth_service.dart' as _i171;
import '../auth/service/forgot_pwd_service.dart' as _i854;
import '../auth/service/pre_profile_service.dart' as _i517;
import '../happening/happening_service.dart' as _i530;
import '../home/home_job_service.dart' as _i646;
import '../job/service/applied_job_service.dart' as _i1004;
import '../job/service/job_service.dart' as _i359;
import '../practice/services/leaderboards_service.dart' as _i114;
import '../practice/services/practice_service.dart' as _i753;
import '../profile/service/profile_service.dart' as _i254;
import '../profile/service/profile_service_2.dart' as _i406;
import '../profile/service/profile_service_3.dart' as _i54;
import '../profile/service/profile_service_4.dart' as _i899;
import '../profile/service/profile_service_5.dart' as _i863;
import '../profile/service/settings_service.dart' as _i52;
import '../settings_logic.dart' as _i956;
import 'api/dio_client.dart' as _i891;
import 'azure_storage_service.dart' as _i865;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i891.FilePickerCubit>(() => _i891.FilePickerCubit());
  gh.lazySingleton<_i353.ImagePickerCubit>(() => _i353.ImagePickerCubit());
  gh.lazySingleton<_i224.NotificationCubit>(() => _i224.NotificationCubit());
  gh.lazySingleton<_i45.AppLogic>(() => _i45.AppLogic());
  gh.lazySingleton<_i956.SettingsLogic>(() => _i956.SettingsLogic());
  gh.lazySingleton<_i957.AuthInfo>(() => _i957.AuthInfo());
  gh.lazySingleton<_i530.HappeningService>(() => _i41.HappeningRepo());
  gh.lazySingleton<_i359.JobService>(() => _i493.JobRepo());
  gh.lazySingleton<_i854.ForgotPasswordService>(
      () => _i554.ForgotPasswordRepo());
  gh.lazySingleton<_i863.ProfileManageService4>(() => _i392.ProfileRepo5());
  gh.lazySingleton<_i406.ProfileManageService>(() => _i839.ProfileManageRepo());
  gh.lazySingleton<_i1004.AppliedJobService>(() => _i921.AppliedJobRepo());
  gh.lazySingleton<_i114.LeaderboardsService>(() => _i493.PracticeRepo());
  gh.lazySingleton<_i54.ProfileManageService2>(() => _i834.ProfileMRepo2());
  gh.lazySingleton<_i52.SettingsService>(() => _i665.SettingsRepo());
  gh.lazySingleton<_i171.AuthService>(() => _i786.AuthRepo());
  gh.lazySingleton<_i849.AppliedJobCubit>(
      () => _i849.AppliedJobCubit(gh<_i1004.AppliedJobService>()));
  gh.lazySingleton<_i864.AppliedJobDetailCubit>(
      () => _i864.AppliedJobDetailCubit(gh<_i1004.AppliedJobService>()));
  gh.lazySingleton<_i865.AzureStorageService>(() => _i614.AzureStorageRepo());
  gh.lazySingleton<_i899.ProfileManageService3>(
      () => _i70.ProfileManageRepo3());
  gh.lazySingleton<_i753.PracticeService>(() => _i544.PracticeRepo());
  gh.lazySingleton<_i127.EventOccurredCubit>(
      () => _i127.EventOccurredCubit(gh<_i530.HappeningService>()));
  gh.lazySingleton<_i935.EventPreviewCubit>(
      () => _i935.EventPreviewCubit(gh<_i530.HappeningService>()));
  gh.lazySingleton<_i825.EventRegisterCubit>(
      () => _i825.EventRegisterCubit(gh<_i530.HappeningService>()));
  gh.lazySingleton<_i419.FeedbackSubmissionCubit>(
      () => _i419.FeedbackSubmissionCubit(gh<_i530.HappeningService>()));
  gh.lazySingleton<_i873.HappeningDetailCubit>(
      () => _i873.HappeningDetailCubit(gh<_i530.HappeningService>()));
  gh.lazySingleton<_i353.HappeningListCubit>(
      () => _i353.HappeningListCubit(gh<_i530.HappeningService>()));
  gh.lazySingleton<_i349.RegisteredEventCubit>(
      () => _i349.RegisteredEventCubit(gh<_i530.HappeningService>()));
  gh.lazySingleton<_i32.SavedHappeningCubit>(
      () => _i32.SavedHappeningCubit(gh<_i530.HappeningService>()));
  gh.lazySingleton<_i254.ProfileService>(() => _i1008.ProfileRepo());
  gh.lazySingleton<_i328.CvResumeCubit>(() => _i328.CvResumeCubit(
        gh<_i406.ProfileManageService>(),
        gh<_i891.FilePickerCubit>(),
        gh<_i865.AzureStorageService>(),
      ));
  gh.lazySingleton<_i886.EducationCubit>(() => _i886.EducationCubit(
        gh<_i406.ProfileManageService>(),
        gh<_i986.FilePickerCubit>(),
        gh<_i865.AzureStorageService>(),
      ));
  gh.lazySingleton<_i517.PreProfileService>(() => _i32.PreProfileRepo());
  gh.lazySingleton<_i646.HomeJobService>(() => _i271.HomeRepo());
  gh.lazySingleton<_i864.AwardAchievementCubit>(
      () => _i864.AwardAchievementCubit(gh<_i54.ProfileManageService2>()));
  gh.lazySingleton<_i481.ProfessionalExamCubit>(
      () => _i481.ProfessionalExamCubit(gh<_i54.ProfileManageService2>()));
  gh.lazySingleton<_i755.SeminarTrainingCubit>(
      () => _i755.SeminarTrainingCubit(gh<_i54.ProfileManageService2>()));
  gh.lazySingleton<_i972.VolunteeringExperienceCubit>(() =>
      _i972.VolunteeringExperienceCubit(gh<_i54.ProfileManageService2>()));
  gh.lazySingleton<_i681.SuggestedListCubit>(
      () => _i681.SuggestedListCubit(gh<_i359.JobService>()));
  gh.lazySingleton<_i450.CampusJobCubit>(
      () => _i450.CampusJobCubit(gh<_i359.JobService>()));
  gh.lazySingleton<_i462.JobDetailCubit>(
      () => _i462.JobDetailCubit(gh<_i359.JobService>()));
  gh.lazySingleton<_i338.JobListCubit>(
      () => _i338.JobListCubit(gh<_i359.JobService>()));
  gh.lazySingleton<_i107.SavedJobsCubit>(
      () => _i107.SavedJobsCubit(gh<_i359.JobService>()));
  gh.factory<_i373.ApplyJobCubit>(
      () => _i373.ApplyJobCubit(gh<_i359.JobService>()));
  gh.factory<_i858.ForgotPwdCubit>(
      () => _i858.ForgotPwdCubit(gh<_i854.ForgotPasswordService>()));
  gh.lazySingleton<_i629.DepartmentListCubit>(
      () => _i629.DepartmentListCubit(gh<_i517.PreProfileService>()));
  gh.factory<_i83.AspirationListCubit>(
      () => _i83.AspirationListCubit(gh<_i517.PreProfileService>()));
  gh.factory<_i560.InstituteListCubit>(
      () => _i560.InstituteListCubit(gh<_i517.PreProfileService>()));
  gh.lazySingleton<_i315.EnrolledPracticeListCubit>(
      () => _i315.EnrolledPracticeListCubit(gh<_i753.PracticeService>()));
  gh.lazySingleton<_i13.EnrolledProcessListCubit>(
      () => _i13.EnrolledProcessListCubit(gh<_i753.PracticeService>()));
  gh.lazySingleton<_i599.EnrollPracticeCubit>(
      () => _i599.EnrollPracticeCubit(gh<_i753.PracticeService>()));
  gh.lazySingleton<_i929.PracticeDetailCubit>(
      () => _i929.PracticeDetailCubit(gh<_i753.PracticeService>()));
  gh.lazySingleton<_i847.PracticeListCubit>(
      () => _i847.PracticeListCubit(gh<_i753.PracticeService>()));
  gh.lazySingleton<_i150.AcademicInfoCubit>(
      () => _i150.AcademicInfoCubit(gh<_i863.ProfileManageService4>()));
  gh.lazySingleton<_i956.LanguageCubit>(
      () => _i956.LanguageCubit(gh<_i863.ProfileManageService4>()));
  gh.lazySingleton<_i1022.SkillsCubit>(
      () => _i1022.SkillsCubit(gh<_i863.ProfileManageService4>()));
  gh.lazySingleton<_i848.WorkExperienceCubit>(() => _i848.WorkExperienceCubit(
        gh<_i406.ProfileManageService>(),
        gh<_i986.FilePickerCubit>(),
        gh<_i899.ProfileManageService3>(),
        gh<_i865.AzureStorageService>(),
      ));
  gh.factory<_i106.ProfileCompletionRateCubit>(
      () => _i106.ProfileCompletionRateCubit(gh<_i52.SettingsService>()));
  gh.lazySingleton<_i552.DeactivateAccountCubit>(
      () => _i552.DeactivateAccountCubit(gh<_i52.SettingsService>()));
  gh.lazySingleton<_i642.DeleteAccountCubit>(
      () => _i642.DeleteAccountCubit(gh<_i52.SettingsService>()));
  gh.lazySingleton<_i411.PersonalInfoSettingCubit>(
      () => _i411.PersonalInfoSettingCubit(gh<_i52.SettingsService>()));
  gh.lazySingleton<_i897.ResetPasswordCubit>(
      () => _i897.ResetPasswordCubit(gh<_i52.SettingsService>()));
  gh.lazySingleton<_i346.TokenCubit>(
      () => _i346.TokenCubit(gh<_i171.AuthService>()));
  gh.lazySingleton<_i130.LeaderboardsListCubit>(
      () => _i130.LeaderboardsListCubit(gh<_i114.LeaderboardsService>()));
  gh.lazySingleton<_i911.SpecificPracticeLeaderboardsListCubit>(() =>
      _i911.SpecificPracticeLeaderboardsListCubit(
          gh<_i114.LeaderboardsService>()));
  gh.lazySingleton<_i256.StudentProfileSubmissionCubit>(
      () => _i256.StudentProfileSubmissionCubit(
            gh<_i346.TokenCubit>(),
            gh<_i517.PreProfileService>(),
            gh<_i865.AzureStorageService>(),
          ));
  gh.lazySingleton<_i304.CertificateCubit>(() => _i304.CertificateCubit(
        gh<_i406.ProfileManageService>(),
        gh<_i986.FilePickerCubit>(),
        gh<_i865.AzureStorageService>(),
      ));
  gh.lazySingleton<_i143.ProjectCubit>(() => _i143.ProjectCubit(
        gh<_i406.ProfileManageService>(),
        gh<_i986.FilePickerCubit>(),
        gh<_i865.AzureStorageService>(),
      ));
  gh.factory<_i1009.ResendOtpCubit>(() => _i1009.ResendOtpCubit(
        gh<_i854.ForgotPasswordService>(),
        gh<_i171.AuthService>(),
      ));
  gh.lazySingleton<_i455.AffiliationsCubit>(
      () => _i455.AffiliationsCubit(gh<_i899.ProfileManageService3>()));
  gh.lazySingleton<_i233.ReferencesCubit>(
      () => _i233.ReferencesCubit(gh<_i899.ProfileManageService3>()));
  gh.lazySingleton<_i1036.ProfileBloc>(() => _i1036.ProfileBloc(
        gh<_i254.ProfileService>(),
        gh<_i986.TokenCubit>(),
      ));
  gh.singleton<_i891.DioClient>(() => _i891.DioClient(gh<_i986.TokenCubit>()));
  gh.lazySingleton<_i1027.UpdateCvResumeCubit>(() => _i1027.UpdateCvResumeCubit(
        gh<_i406.ProfileManageService>(),
        gh<_i865.AzureStorageService>(),
      ));
  gh.lazySingleton<_i426.CandidateProfileBloc>(() => _i426.CandidateProfileBloc(
        gh<_i254.ProfileService>(),
        gh<_i865.AzureStorageService>(),
      ));
  gh.lazySingleton<_i447.OrganizationActivitiesCubit>(
      () => _i447.OrganizationActivitiesCubit(
            gh<_i899.ProfileManageService3>(),
            gh<_i986.FilePickerCubit>(),
            gh<_i865.AzureStorageService>(),
          ));
  gh.lazySingleton<_i930.ExpectedSalaryCubit>(
      () => _i930.ExpectedSalaryCubit(gh<_i254.ProfileService>()));
  gh.lazySingleton<_i992.PersonalInfoCubit>(
      () => _i992.PersonalInfoCubit(gh<_i254.ProfileService>()));
  gh.lazySingleton<_i484.ProfileSubmissionCubit>(
      () => _i484.ProfileSubmissionCubit(
            gh<_i346.TokenCubit>(),
            gh<_i517.PreProfileService>(),
          ));
  gh.lazySingleton<_i621.HomeCubit>(() => _i621.HomeCubit(
        gh<_i646.HomeJobService>(),
        gh<_i359.JobService>(),
      ));
  gh.lazySingleton<_i868.HomeSearchCubit>(() => _i868.HomeSearchCubit(
        gh<_i646.HomeJobService>(),
        gh<_i359.JobService>(),
      ));
  gh.factory<_i103.LoginCubit>(() => _i103.LoginCubit(
        gh<_i171.AuthService>(),
        gh<_i986.TokenCubit>(),
      ));
  return getIt;
}
