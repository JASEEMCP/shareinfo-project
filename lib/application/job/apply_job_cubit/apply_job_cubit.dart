import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/service/job_service.dart';

part 'apply_job_state.dart';
part 'apply_job_cubit.freezed.dart';

@injectable
class ApplyJobCubit extends Cubit<ApplyJobState> {
  final JobService _jobService;
  ApplyJobCubit(this._jobService) : super(const ApplyJobState.initial());

  ///Get applied jobs detail data
  Future<void> applyJob(ApplyJobModel model) async {
    emit(const ApplyJobState.loading());
    final result = await _jobService.applyJob(model);
    result.fold(
      (error) => emit(ApplyJobState.error(error)),
      (success) {
        emit(const ApplyJobState.success());
      },
    );
  }
}

///Create an object for global access
ApplyJobModel applyJobModel = ApplyJobModel();

///This is data formate for applying a job
class ApplyJobModel {
  final String? jobId;
  final bool? isCampus;
  ApplyJobModel({this.jobId, this.isCampus});
}
