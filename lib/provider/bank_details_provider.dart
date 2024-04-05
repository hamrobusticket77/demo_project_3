import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/model/bank_details.dart';
import 'package:frontend_vendor/model/otp_state.dart';
import 'package:frontend_vendor/services/details_service.dart';

final defaultState = ApiStatusState(
    isError: false, isLoading: false, error: '', isSuccess: false);

class BankDetailsProvider extends StateNotifier<ApiStatusState> {
  BankDetailsProvider() : super(defaultState);

  Future addBankDetails(
      {required String bankName,
      required String accountNumber,
      required String beneficaryName,
      required String accountType,
      required String citizenShip,
      required Function onSuccess,
      required Function(String) onError}) async {
    DetailsService detailsService = DetailsService();
    BankDetailsModel bankDetails = BankDetailsModel(
      bankName: bankName,
      accountNumber: accountNumber,
      beneficaryName: beneficaryName,
      bankaccountType: accountType,
      citizenshipNumber: citizenShip,
    );
    state.copyWith(isLoading: true);
    final response =
        await detailsService.postBankDetails(bankDetails: bankDetails);
    response.fold((l) {
      onSuccess();
      state.copyWith(isLoading: false, isSuccess: true);
    }, (r) {
      state.copyWith(isLoading: false, isError: true, error: r);
      onError(r);
    });
  }
}

final bankDetailsProvider =
    StateNotifierProvider<BankDetailsProvider, ApiStatusState>(
        (ref) => BankDetailsProvider());
