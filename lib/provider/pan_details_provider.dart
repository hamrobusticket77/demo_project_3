import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/model/otp_state.dart';
import 'package:frontend_vendor/model/pan_details.dart';
import 'package:frontend_vendor/services/details_service.dart';


final defaultState = ApiStatusState(
    isError: false, isLoading: false, error: '', isSuccess: false);



class PanDetailsProvider extends StateNotifier<ApiStatusState>{
   PanDetailsProvider(): super(defaultState);
   final detailsService = DetailsService();
    Future<void> addPanDetails({
      required String panName,
      required String panAddress,
  
      required String issueDate,
      required String dob,
      required Function onSuccess,
      required Function(String error) onError,
    }) async {
      state = state.copyWith(isLoading: true);
      PanDetailsModel pandetails=PanDetailsModel(panName: panName, panAddress: panAddress, issueDate: issueDate, dob: dob );
    
      final response = await detailsService.addPanDetail(panDetailsModel: pandetails);
      response.fold((l) {
        state = state.copyWith(isLoading: false, isSuccess: true);
        onSuccess();
      }, (r) {
        state = state.copyWith(isLoading: false, isError: true, error: r);
        onError(r);
      });
      state = state.copyWith(isLoading: false);
    }
}

final panDetailsProvider= StateNotifierProvider<PanDetailsProvider, ApiStatusState>((ref) => PanDetailsProvider());