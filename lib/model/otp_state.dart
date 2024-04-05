class ApiStatusState {
  final bool isError;
  final bool isLoading;
  final String error;
  final bool isSuccess;
  final bool isValidated;
  
  ApiStatusState(
      {required this.isError, required this.isLoading, required this.error,required this.isSuccess,this.isValidated=false});

  ApiStatusState copyWith(
    {
      bool? isError,
      bool? isLoading,
      String? error,
      bool? isSuccess,
      bool? isValidated,

    }
  ){
    return ApiStatusState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSuccess: isSuccess ?? this.isSuccess,
      isValidated: isValidated ?? this.isValidated ,
    );
  }    
      
}
