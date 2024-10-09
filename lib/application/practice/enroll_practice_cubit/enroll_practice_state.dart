part of 'enroll_practice_cubit.dart';

@freezed
class EnrollPracticeState with _$EnrollPracticeState {
  const factory EnrollPracticeState.initial() = _Initial;

  const factory EnrollPracticeState.enrolling() = _Enrolling;
  const factory EnrollPracticeState.enrolled() = _Enrolled;
  const factory EnrollPracticeState.error(MainFailure e) = _Error;
}

extension EnrollPracticeStateX on EnrollPracticeState {
  bool get isEnrolling => this is _Enrolling;

  bool get isEnrolled => this is _Enrolled;

  bool get isError => this is _Error;
}
