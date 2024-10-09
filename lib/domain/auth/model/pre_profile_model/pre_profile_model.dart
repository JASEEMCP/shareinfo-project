import 'package:json_annotation/json_annotation.dart';

part 'pre_profile_model.g.dart';

@JsonSerializable()
class PreProfileModel {
  @JsonKey(name: 'current_institute')
  int? currentInstitute;
  @JsonKey(name: 'current_status')
  String? currentStatus;
  @JsonKey(name: 'expertise')
  String? expertise;
  @JsonKey(name: 'aspirational_fields')
  List<int>? aspirationalFields;

  @JsonKey(name: 'stream')
  String? stream;
  @JsonKey(name: 'register_id')
  String? registerId;
  @JsonKey(name: 'current_semester')
  String? currentSemester;
  @JsonKey(name: 'start_date')
  int? startDate;
  @JsonKey(name: 'end_date')
  int? endDate;
  @JsonKey(name: 'cgpa')
  double? cgpa;
  @JsonKey(name: 'scale')
  int? scale;
  @JsonKey(name: 'id_card_front')
  String? idFront;
  @JsonKey(name: 'id_card_back')
  String? idBack;
  @JsonKey(name: 'backlogs')
  int? backlogs;

  PreProfileModel({
    this.currentInstitute,
    this.currentStatus,
    this.expertise,
    this.aspirationalFields,
    this.backlogs,
    this.cgpa,
    this.endDate,
    this.idBack,
    this.idFront,
    this.scale,
    this.startDate,
    this.stream,
    this.currentSemester,
    this.registerId,
  });

  factory PreProfileModel.fromJson(Map<String, dynamic> json) {
    return _$PreProfileModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PreProfileModelToJson(this);

  Map<String, dynamic> nonStudentModel() => {
        'current_status': currentStatus,
        'expertise': expertise,
        'aspirational_fields': aspirationalFields,
      };

  PreProfileModel copyWith({
    int? currentInstitute,
    String? currentStatus,
    String? expertise,
    List<int>? aspirationalFields,
    String? stream,
    int? startDate,
    int? endDate,
    double? cgpa,
    int? scale,
    String? idFront,
    String? idBack,
    int? backlogs,
    String? currentSemester,
    String? registerId,
  }) {
    return PreProfileModel(
      currentInstitute: currentInstitute ?? this.currentInstitute,
      currentStatus: currentStatus ?? this.currentStatus,
      expertise: expertise ?? this.expertise,
      aspirationalFields: aspirationalFields ?? this.aspirationalFields,
      scale: scale ?? this.scale,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      stream: stream ?? this.stream,
      backlogs: backlogs ?? this.backlogs,
      idBack: idBack ?? this.idBack,
      idFront: idFront ?? this.idFront,
      cgpa: cgpa ?? this.cgpa,
      currentSemester: currentSemester ?? this.currentSemester,
      registerId: registerId ?? this.registerId,
    );
  }
}
