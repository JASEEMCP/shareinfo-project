import 'package:dartz/dartz.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/happening/happening_model/happening_model.dart';

abstract class HappeningService {
  Future<Either<MainFailure, List<HappeningModel>>> getHappeningList(
      String? query, String endPoint);
  Future<Either<MainFailure, String>> registerHappening(String eventId);

  Future<Either<MainFailure, HappeningModel>> getHappeningPreview(
      String eventId);
  Future<Either<MainFailure, HappeningModel>> getEventDetail(String eventId);
  Future<Either<MainFailure, String>> saveEvent(String eventId, bool isSaved);

  Future<Either<MainFailure, String>> sentFeedBack(
      String eventId, int rate, String feedbackText);
}
