import 'package:frontend_vendor/model/profile_model.dart';

class ProfileState {
  bool isLoading;
  bool isSuccess;
  bool isError;
  ProfileModel? profileModel;
  bool isImageUploading;

  ProfileState({
    required this.isLoading,
    required this.isSuccess,
    required this.isError,
    this.profileModel,
    required this.isImageUploading,
  });

  ProfileState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    ProfileModel? profileModel,
    bool? isImageUploading,
    
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      profileModel: profileModel ?? this.profileModel,
      isImageUploading: isImageUploading ?? this.isImageUploading,
    );
  }
}
