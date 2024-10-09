import 'package:json_annotation/json_annotation.dart';
import 'package:shareinfo/domain/job/model/job_card_model/job_card_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeJobModel {
  List<JobCardModel>? jobList;
  List<String>? domain;

  HomeJobModel({this.jobList, this.domain});

  factory HomeJobModel.fromJson(Map<String, dynamic> json) {
    return _$HomeJobModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeJobModelToJson(this);

  HomeJobModel copyWith({List<JobCardModel>? jobList, List<String>? domain}) {
    return HomeJobModel(
      jobList: jobList ?? this.jobList,
      domain: domain ?? this.domain,
    );
  }
}
