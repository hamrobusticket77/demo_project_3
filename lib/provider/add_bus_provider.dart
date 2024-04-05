import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/model/bus_add_model.dart';
import 'package:frontend_vendor/model/bus_add_state.dart';
import 'package:frontend_vendor/services/bus_configuration_service.dart';
import 'package:frontend_vendor/services/document_service.dart';


final defaultBusAddState = BusAddState(busImage: [],isLoading: false);

class BusAddProvider extends StateNotifier<BusAddState> {
  BusAddProvider() : super(defaultBusAddState);

  BusConfigurationService service = BusConfigurationService();

  void addBusImage(File image) {
    state = state.copyWith(busImage: [...state.busImage, image]);
  }

  void clerImage() {
    state = state.copyWith(busImage: []);
  }

  void getModel({
    required BusAddModel busAddModel,
    required Function onSuccess,
  }) async {
    String? id;
    state = state.copyWith(isLoading: true);

    final generateResonse = await service.getId();
    generateResonse.fold((l) {
      id = l;
      
    }, (error) {
      // state = state.copyWith(errorMessage: error);
    });
    if (id != null) {
      await DocumentService().uploadImages(state.busImage, id!) ;
      final addbusResponse = await service.addBus(busAddModel, id!);
      addbusResponse.fold((l) {
        onSuccess();
      }, (error) {});
    }
    state = state.copyWith(isLoading: false);
  }
}






final addBusProvider =
    StateNotifierProvider<BusAddProvider, BusAddState>((ref) {
  return BusAddProvider();
});
