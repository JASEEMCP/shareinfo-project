import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/domain/practice/models/practice_list_model/practice_list_model.dart';
import 'package:shareinfo/domain/practice/services/practice_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

part 'practice_list_state.dart';
part 'practice_list_cubit.freezed.dart';

@lazySingleton
class PracticeListCubit extends Cubit<PracticeListState> {
  final PracticeService _practiceService;
  PracticeListCubit(this._practiceService)
      : super(const PracticeListState.initial());

  List<PracticeListModel> items = [];
  Future<void> getPracticeList() async {
    if (items.isNotEmpty) return;
    emit(const PracticeListState.loading());

    final r = await _practiceService.getPracticeList();

    r.fold(
      (e) => emit(PracticeListState.error(e)),
      (item) {
        items = item;
        emit(PracticeListState.success(item));
      },
    );
  }

  Future<void> refreshPracticeList() async {
    emit(const PracticeListState.loading());

    final r = await _practiceService.getPracticeList();

    r.fold(
      (e) => emit(PracticeListState.error(e)),
      (item) {
        items = item;
        emit(PracticeListState.success(item));
      },
    );
  }
}
