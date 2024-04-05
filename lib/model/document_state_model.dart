import 'dart:io';

class DocumentState {
  final bool isError;
  final bool isLoading;
  final String error;
  final bool isSuccess;
  File? panCard, citizenship, drivingLiscence;

  DocumentState(
      {required this.isError,
      required this.isLoading,
      required this.error,
      required this.isSuccess,
      this.panCard,
      this.citizenship,
      this.drivingLiscence});

  DocumentState copyWith({
    bool? isError,
    bool? isLoading,
    String? error,
    bool? isSuccess,
    File? panCard,
    File? drivingLiscence,
    File? citizenship,
  }) {
    return DocumentState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSuccess: isSuccess ?? this.isSuccess,
      panCard: panCard ?? this.panCard,
      citizenship: citizenship ?? this.citizenship,
      drivingLiscence: drivingLiscence ?? this.drivingLiscence,
    );
  }

  DocumentState setPropertyToNull(String propertyName) {
    switch (propertyName) {
      case 'panCard':
        return DocumentState(
          isError: isError,
          isLoading: isLoading,
          error: error,
          isSuccess: isSuccess,
          panCard: null,
          citizenship: citizenship,
          drivingLiscence: drivingLiscence,
        );
      case 'citizenship':
        return DocumentState(
          isError: isError,
          isLoading: isLoading,
          error: error,
          isSuccess: isSuccess,
          panCard: panCard,
          citizenship: null,
          drivingLiscence: drivingLiscence,
        );
      case 'drivingLiscence':
        return DocumentState(
          isError: isError,
          isLoading: isLoading,
          error: error,
          isSuccess: isSuccess,
          panCard: panCard,
          citizenship: citizenship,
          drivingLiscence: null,
        );
      default:
        // If an unknown property name is provided, return the original state
        return this;
    }
  }


}
