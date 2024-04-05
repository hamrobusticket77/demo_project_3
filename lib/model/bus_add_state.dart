import 'dart:io';

class BusAddState {
  bool isLoading;
  List<File> busImage = [];

  BusAddState({
    required this.isLoading,
    required this.busImage,
  });

  BusAddState copyWith({
    List<File>? busImage,
    bool? isLoading,
  }) {
    return BusAddState(
      busImage: busImage ?? this.busImage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
