import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shareinfo/application/profile/profile_bloc/profile_bloc.dart';
import 'package:shareinfo/domain/common/injectable.dart';
import 'package:shareinfo/domain/failures/common_failure.dart';
import 'package:shareinfo/domain/profile/model/personal_info_model/personal_info_model.dart';
import 'package:shareinfo/domain/profile/model/profile_model/summary_model.dart';
import 'package:shareinfo/domain/profile/service/profile_service.dart';

part 'personal_info_state.dart';
part 'personal_info_cubit.freezed.dart';

@lazySingleton
class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final ProfileService _profileService;

  PersonalInfoCubit(this._profileService) : super(PersonalInfoState.initial());
  PersonalInfoModel model = PersonalInfoModel();
  SummaryModel summary = SummaryModel();

  Future<void> getPersonalInfo() async {
    emit(state.copyWith(isLoading: true, userData: model, saveSuccess: false));

    final result = await _profileService.getPersonalInfo();
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isError: true,
          isLoading: false,
        ),
      ),
      (userData) {
        model = userData;
        emit(
          state.copyWith(
            isError: false,
            isLoading: false,
            isSuccess: true,
            userData: model,
          ),
        );
      },
    );
  }

  Future<void> savePersonalInfo(PersonalInfoModel temp) async {
    model = temp;

    emit(state.copyWith(isSaving: true, userData: model, saveSuccess: false));

    final result = await _profileService.updateProfileInfo(model);
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isError: true,
          isSaving: false,
          saveSuccess: false,
        ),
      ),
      (_) {
        getIt<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        emit(
          state.copyWith(
            isSaving: false,
            isError: false,
            saveSuccess: true,
            userData: model,
          ),
        );
      },
    );
  }

//fetching postal code info
  Future<void> fetchPinCodeAddress(
      int pincode, PersonalInfoModel currentModel) async {
    model.postalPin = pincode;

    emit(state.copyWith(fetchingPincode: true, userData: model));
    final result = await _profileService.getPincodeAddress(pincode);
    result.fold(
      //Fetching is error previous user data is initialize
      (error) {
        model.postalPin = null;
        model.district = null;
        model.city = null;
        model.state = null;
        debugPrint('Invalid postal code ;${model.toJson()}');
        emit(state.copyWith(userData: model, fetchingPincode: false));
      },
      (pincodeList) {
        //if success fetching otp address previous data is replace with new pincode address
        model = model.copyWith(
          postalPin: int.parse('${pincodeList[0].pincode}'),
          city: pincodeList[0].division,
          district: pincodeList[0].district,
          state: pincodeList[0].state,
        );

        emit(
          state.copyWith(
            isError: false,
            isLoading: false,
            isSuccess: true,
            userData: model,
            fetchingPincode: false,
          ),
        );
      },
    );
  }

  //Get summary
  Future<void> getSummary() async {
    emit(state.copyWith(
        isLoading: true, summaryText: summary, saveSuccess: false));

    final result = await _profileService.getSummary();
    result.fold(
      (error) => emit(
        state.copyWith(
          error: error,
          isError: true,
          isLoading: false,
        ),
      ),
      (summaryText) {
        summary = summaryText;
        emit(
          state.copyWith(
            isError: false,
            isLoading: false,
            isSuccess: true,
            summaryText: summary,
          ),
        );
      },
    );
  }

//Save summary
  Future<void> saveSummaryText(SummaryModel temp) async {
    summary = temp;
    emit(state.copyWith(isSaving: true, saveSuccess: false));

    final result = await _profileService.updateSummary(summary);
    result.fold(
      (error) => emit(
        state.copyWith(
            error: error,
            isError: true,
            isLoading: false,
            isSaving: false,
            saveSuccess: false),
      ),
      (_) {
        getIt<ProfileBloc>().add(const ProfileEvent.refreshProfile());
        emit(
          state.copyWith(
            isSaving: false,
            isError: false,
            saveSuccess: true,
            summaryText: summary,
          ),
        );
      },
    );
  }

  ///replace every data into null
  void clearData() {
    summary = SummaryModel();
    model = PersonalInfoModel();
    emit(PersonalInfoState.initial());
    return;
  }
}
