import 'package:flutter/material.dart';
import 'package:shareinfo/presentation/home/screens/search_screen.dart';
import 'package:shareinfo/presentation/home/screens/suggestion_screen.dart';
import 'package:shareinfo/presentation/jobs/job_screen.dart';
import 'package:shareinfo/presentation/jobs/screens/campus_placement_screen.dart';
import 'package:shareinfo/presentation/jobs/screens/saved_jobs.dart';
import 'package:shareinfo/style/theme.dart';

enum JobType { jobs, campusJobs, savedJobs, search, suggestedJobs }

enum JobCategory { all, openRecruitment, campusRecruitment }

enum JobQueryType { workingMode, jobTitle, domain }

enum ApplicationStatus { sent, pending, approved, rejected, shortListed }

String getApplicationStatusStringByType(ApplicationStatus status) {
  switch (status) {
    case ApplicationStatus.sent:
      return 'Sent';
    case ApplicationStatus.pending:
      return 'Pending';
    case ApplicationStatus.approved:
      return 'Approved';
    case ApplicationStatus.shortListed:
      return 'Shortlisted';
    case ApplicationStatus.rejected:
      return 'Rejected';
  }
}

StatusColorPallet getStatusColorSet(String status) {
  final theme = AppTheme.fromType(ThemeType.shareInfoLight);
  switch (status) {
    case 'Sent':
      return StatusColorPallet(theme.statusBlue, theme.statusBlueAccentDark);
    case 'Pending':
      return StatusColorPallet(
          theme.statusYellow, theme.statusYellowAccentDark);
    case 'Approved':
      return StatusColorPallet(theme.statusGreen, theme.statusGreenAccentDark);
    case 'Shortlisted':
      return StatusColorPallet(theme.statusGreen, theme.statusGreenAccentDark);
    case 'Rejected':
      return StatusColorPallet(theme.statusRed, theme.statusRedAccentDark);
    default:
      return StatusColorPallet(theme.statusBlue, theme.statusBlueAccentDark);
  }
}

class StatusColorPallet {
  final Color textColor;
  final Color background;
  StatusColorPallet(this.background, this.textColor);
}

String getQueryType(JobQueryType type) {
  switch (type) {
    case JobQueryType.workingMode:
      return 'working_mode';
    case JobQueryType.jobTitle:
      return 'job_title';
    case JobQueryType.domain:
      return 'domain';
  }
}

Widget jobScreenWithType(JobType type) {
  switch (type) {
    case JobType.jobs:
      return const ScreenJob();
    case JobType.campusJobs:
      return const ScreenCampusPlacement();
    case JobType.savedJobs:
      return ScreenJobsSaved();
    case JobType.suggestedJobs:
      return const ScreenJobSuggestion();
    default:
      return const ScreenHomeSearch();
  }
}

String jobScreenPathWithType(JobType type) {
  switch (type) {
    case JobType.jobs:
      return '/job';
    case JobType.campusJobs:
      return '/campus_jobs';
    case JobType.savedJobs:
      return '/saved_jobs';
    case JobType.suggestedJobs:
      return '/suggested_jobs';
    default:
      return '/search_job';
  }
}

JobType parcStringToJobType(String value) {
  switch (value) {
    case 'job':
      return JobType.jobs;
    case 'campus_jobs':
      return JobType.campusJobs;
    case 'saved_jobs':
      return JobType.savedJobs;
    case 'suggested_jobs':
      return JobType.suggestedJobs;
    default:
      return JobType.search;
  }
}
