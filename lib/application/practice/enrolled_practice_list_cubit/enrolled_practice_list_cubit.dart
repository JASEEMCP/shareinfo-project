import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/practice/models/enrolled_practice_list/enrolled_practice_list.dart';
import 'package:shareinfo/domain/practice/services/practice_service.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

part 'enrolled_practice_list_state.dart';
part 'enrolled_practice_list_cubit.freezed.dart';

@lazySingleton
class EnrolledPracticeListCubit extends Cubit<EnrolledPracticeListState> {
  final PracticeService _practiceService;

  EnrolledPracticeListCubit(this._practiceService)
      : super(const EnrolledPracticeListState.initial());

  List<EnrolledPracticeList> items = [];

  Future<void> getEnrolledPracticeList() async {
    if (items.isNotEmpty) return;
    emit(const EnrolledPracticeListState.loading());

    final r = await _practiceService.getEnrolledPracticeList();

    r.fold(
      (e) => emit(EnrolledPracticeListState.error(e)),
      (item) {
        items = item;
        emit(EnrolledPracticeListState.success(item));
      },
    );
  }

  Future<void> refreshEnrolledPracticeList() async {
    emit(const EnrolledPracticeListState.loading());

    final r = await _practiceService.getEnrolledPracticeList();

    r.fold(
      (e) => emit(EnrolledPracticeListState.error(e)),
      (item) {
        items = item;
        emit(EnrolledPracticeListState.success(item));
      },
    );
  }
}
