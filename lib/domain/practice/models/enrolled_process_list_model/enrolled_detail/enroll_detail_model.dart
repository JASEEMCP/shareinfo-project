import 'package:json_annotation/json_annotation.dart';
import 'package:shareinfo/domain/practice/models/enrolled_detailed_view_model/enrolled_detailed_view_model.dart';
import 'package:shareinfo/domain/practice/models/specific_enrolled_process_model/specific_enrolled_process_model.dart';

import '../enrolled_process_list_model.dart';

part 'enroll_detail_model.g.dart';

@JsonSerializable()
class EnrollDetailModel {
  EnrolledDetailedViewModel? enrolledDetail;
  List<EnrolledProcessListModel>? processList;
  
  

  EnrollDetailModel({
    this.enrolledDetail,
    this.processList,
    
  });

  factory EnrollDetailModel.fromJson(Map<String, dynamic> json) {
    return _$EnrollDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EnrollDetailModelToJson(this);
}
