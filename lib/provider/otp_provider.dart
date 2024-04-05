import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/model/otp_state.dart';
import 'package:frontend_vendor/services/otp_services.dart';

final defaultState = ApiStatusState(
    isError: false, isLoading: false, error: '', isSuccess: false);

class OtpNotifier extends StateNotifier<ApiStatusState> {
  OtpNotifier() : super(defaultState);
  OtpService otpService = OtpService();



  void toggleIsValidate(bool value) {
    state = state.copyWith(isValidated: value);
  }

  Future<void> sendOtp({
    required String phone,
    required Function onSuccess,
    required Function onError,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await otpService.sendOtp(phone: phone);
    response.fold((l) {
      state = state.copyWith(isLoading: false, isSuccess: true);
      onSuccess();
    }, (r) {
      if (kDebugMode) {
        print(r);
      }
      state = state.copyWith(isLoading: false, isError: true, error: r);
      onError();
    });
    state = state.copyWith(isLoading: false);
  }
}

final otpNotifierProvider =
    StateNotifierProvider<OtpNotifier, ApiStatusState>((ref) => OtpNotifier());
