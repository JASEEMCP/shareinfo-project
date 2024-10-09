import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/job/model/applied_job_model/applied_job_model.dart';
import 'package:shareinfo/domain/job/service/applied_job_service.dart';

part 'applied_job_detail_state.dart';
part 'applied_job_detail_cubit.freezed.dart';

@lazySingleton
class AppliedJobDetailCubit extends Cubit<AppliedJobDetailState> {
  final AppliedJobService _appliedJobService;
  AppliedJobDetailCubit(this._appliedJobService)
      : super(const AppliedJobDetailState.initial());

  ///Get applied jobs detail data
  Future<void> getAppliedJobDetail(String jobId) async {
    emit(const AppliedJobDetailState.loading());
    final result = await _appliedJobService.getAppliedJobDetail(jobId);
    result.fold(
      (error) => emit(AppliedJobDetailState.error(error)),
      (success) {
        emit(AppliedJobDetailState.success(success));
      },
    );
  }
}
