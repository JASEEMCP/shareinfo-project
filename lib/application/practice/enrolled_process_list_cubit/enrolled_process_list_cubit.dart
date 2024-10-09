import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/practice/models/enrolled_process_list_model/enrolled_detail/enroll_detail_model.dart';
import 'package:shareinfo/domain/practice/models/enrolled_process_list_model/enrolled_process_list_model.dart';
import 'package:shareinfo/domain/practice/services/practice_service.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

part 'enrolled_process_list_state.dart';
part 'enrolled_process_list_cubit.freezed.dart';

@lazySingleton
class EnrolledProcessListCubit extends Cubit<EnrolledProcessListState> {
  final PracticeService _practiceService;
  EnrolledProcessListCubit(this._practiceService)
      : super(const EnrolledProcessListState.initial());

  EnrollDetailModel model = EnrollDetailModel();

  Future<void> getEnrolledProcessList(String id) async {
    emit(const EnrolledProcessListState.loading());

    final r = await _practiceService.genEnrolledProcessList(id);

    r.fold(
      (e) => emit(EnrolledProcessListState.error(e)),
      (item) {
        model = item;
        emit(EnrolledProcessListState.success(model));
      },
    );
  }

  Future<void> getSpecificProcessDetail(String id) async {
    final r = await _practiceService.getSpecificEnrolledProcessList(id);

    r.fold(
      (e) => null,
      (item) {
        for (int index = 0; index < model.processList!.length;index++) {
          if (model.processList?[index].id == id) {
            model.processList?[index].specificProcessDetail = item;

            emit(const EnrolledProcessListState.initial());
            emit(EnrolledProcessListState.success(model));
          }
        }
      },
    );
  }
}
