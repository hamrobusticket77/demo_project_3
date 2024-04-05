import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/model/otp_state.dart';
import 'package:frontend_vendor/model/personal_details_model.dart';
import 'package:frontend_vendor/services/details_service.dart';

final defaultState = ApiStatusState(
    isError: false, isLoading: false, error: '', isSuccess: false);

class PersonalDetailsProvider extends StateNotifier<ApiStatusState> {
  PersonalDetailsProvider() : super(defaultState);

  final detailsService = DetailsService();

  Future addPersonalDetails(
      {required String travelName,
      required String postalCode,
      required String states,
      required String city,
      required String email,
      required String name,
      required String country,
      required String district,
      required Function onSuccess,
      required Function(String) onError
      
      }) async {
    PersonalDetailsModel personalDetails = PersonalDetailsModel(
      travelName: travelName,
      pincode: postalCode,
      state: states,
      city: city,
      email: email,
      name: name,
      country: country,
      district: district,
    );

    state.copyWith(isLoading: true);
    final response =
        await detailsService.getDetails(personalDetails: personalDetails);
    response.fold((l) {
      onSuccess();
      state.copyWith(isLoading: false, isSuccess: true);
      
    }, (r) {
      state.copyWith(isLoading: false, isError: true, error: r);
      onError(r);
     
    });
  }
}

final personalDetailsProvider =
    StateNotifierProvider<PersonalDetailsProvider, ApiStatusState>(
        (ref) => PersonalDetailsProvider());
