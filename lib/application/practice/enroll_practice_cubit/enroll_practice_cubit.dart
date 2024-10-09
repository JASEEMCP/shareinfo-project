import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shareinfo/application/practice/practice_detail_cubit/practice_detail_cubit.dart';
import 'package:shareinfo/core/provider_libs.dart';
import 'package:shareinfo/domain/practice/services/practice_service.dart';
import 'package:shareinfo/infrastructure/service_libs.dart';
import 'package:shareinfo/presentation/core/common_lib.dart';

part 'enroll_practice_state.dart';
part 'enroll_practice_cubit.freezed.dart';

@lazySingleton
class EnrollPracticeCubit extends Cubit<EnrollPracticeState> {
  final PracticeService _practiceService;
  EnrollPracticeCubit(this._practiceService)
      : super(const EnrollPracticeState.initial());

  Future<void> enrollPractice(String id) async {
    emit(const EnrollPracticeState.enrolling());

    final r = await _practiceService.enrollPractice(id);

    r.fold(
      (e) => emit(EnrollPracticeState.error(e)),
      (_) {
        getIt<PracticeDetailCubit>().refreshPracticeDetail(id);
        emit(const EnrollPracticeState.enrolled());
      },
    );
  }
}
