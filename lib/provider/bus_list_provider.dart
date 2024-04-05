import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/model/bus_model.dart';
import 'package:frontend_vendor/services/bus_configuration_service.dart';

class BusListState {
  final bool isLoading;
  final List<BusModel> busList;
  final String errorMessage;

  BusListState(
      {required this.isLoading,
      required this.busList,
      required this.errorMessage});

  BusListState copyWith(
      {bool? isLoading, List<BusModel>? busList, String? errorMessage}) {
    return BusListState(
        isLoading: isLoading ?? this.isLoading,
        busList: busList ?? this.busList,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

final defaultState =
    BusListState(isLoading: false, busList: [], errorMessage: "");

class BusListProvider extends StateNotifier<BusListState> {
  BusListProvider() : super(defaultState) {
    getBusList();
  }

  final busListService = BusConfigurationService();

  Future getBusList() async {
    state = state.copyWith(isLoading: true);

    final response = await busListService.getBusList();
    response.fold((l) => {state = state.copyWith(isLoading: false, busList: l)},
        (r) => {state = state.copyWith(isLoading: false, errorMessage: r)});
  }
}

final busListProvider = StateNotifierProvider<BusListProvider, BusListState>(
    (ref) => BusListProvider());
