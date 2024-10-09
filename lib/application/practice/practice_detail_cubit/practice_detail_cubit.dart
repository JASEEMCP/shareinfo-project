import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/practice/models/practice_detail_model/practice_detail_model.dart';
import 'package:shareinfo/domain/practice/services/practice_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

part 'practice_detail_state.dart';
part 'practice_detail_cubit.freezed.dart';

@lazySingleton
class PracticeDetailCubit extends Cubit<PracticeDetailState> {
  final PracticeService _practiceService;
  PracticeDetailCubit(this._practiceService)
      : super(const PracticeDetailState.initial());

  Future<void> getPracticeDetail(String id) async {
    emit(const PracticeDetailState.loading());

    final r = await _practiceService.getPracticeDetail(id);

    r.fold(
      (e) => emit(PracticeDetailState.error(e)),
      (item) {
        emit(PracticeDetailState.success(item));
      },
    );
  }

  Future<void> refreshPracticeDetail(String id) async {
    final r = await _practiceService.getPracticeDetail(id);

    r.fold(
      (e) => emit(PracticeDetailState.error(e)),
      (item) {
        emit(const PracticeDetailState.initial());
        emit(PracticeDetailState.success(item));
      },
    );
  }
}
