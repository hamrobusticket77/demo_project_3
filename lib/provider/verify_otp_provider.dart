


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/model/otp_state.dart';
import 'package:frontend_vendor/model/user_model.dart';
import 'package:frontend_vendor/services/otp_services.dart';
import 'package:hive/hive.dart';

final defaultState=ApiStatusState(isError: false, isLoading: false, error: 'Otp not correct',isSuccess: false);


class VerifyOtpProvider extends StateNotifier<ApiStatusState>{
  VerifyOtpProvider() : super(defaultState);
  OtpService otpService=OtpService();

  Future<void> verifyOtp({
    required String phone,
    required Function(UserModel user) onSuccess,
    required Function onError,
    required String otp,
    
  }) async{
    state=state.copyWith(isLoading: true);
    final response=await otpService.verifyOtp(phone: phone,otp:otp);
    response.fold((l) {
      state=state.copyWith(isLoading: false,isSuccess: true);
       Box box = Hive.box("localData");
       box.put("token",l.token);
      onSuccess(l);
    }, (r) {
      state=state.copyWith(isLoading: false,isError: true,error: r);
      onError();    
    });
           state=state.copyWith(isLoading: false);
   
  }
}

final verifyOtpProvider=StateNotifierProvider<VerifyOtpProvider, ApiStatusState>((ref)=>VerifyOtpProvider());