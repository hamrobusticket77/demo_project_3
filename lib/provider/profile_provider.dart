import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/constants/constants.dart';
import 'package:frontend_vendor/helper/api_hander.dart';
import 'package:frontend_vendor/model/edit_profile_state.dart';
import 'package:frontend_vendor/services/document_service.dart';
import 'package:frontend_vendor/services/user_service.dart';

final defaultState = ProfileState(
    isLoading: false,
    isSuccess: false,
    isError: false,
    isImageUploading: false);

class ProfileProvider extends StateNotifier<ProfileState> {
  ProfileProvider() : super(defaultState) {
    // Call the initialization method from the constructor
    fetchProfile();
  }

  Future<void> changeProfilePic({
    required File img,
    required Function(String err) onError,
  }) async {
    state = state.copyWith(isImageUploading: true);
    
    final response = await DocumentService().uploadFile(
        file: img,
        type: "profilePic",
        url: UrlConstants.changeUserImage,
        apiMethod: ApiMethod.put);
           
    state=state.copyWith(isImageUploading: false);
    response.fold((l) {
      changeImageUrl(l['url']);
    }, (r) {
      onError(r);
    });
  }

  void changeImageUrl(String imageUrl) {
    state = state.copyWith(
        profileModel: state.profileModel!.copyWith(images: imageUrl));
  }

  Future<void> fetchProfile({r}) async {
    state = state.copyWith(isLoading: true);

    final response = await UserService().getUserData();

    response.fold((l) {
      state =
          state.copyWith(isLoading: false, isSuccess: true, profileModel: l);
    }, (r) {
      state = state.copyWith(
        isLoading: false,
        isError: true,
      );
    });
    state = state.copyWith(isLoading: false);
  }
}

final profileProvider = StateNotifierProvider<ProfileProvider, ProfileState>(
    (ref) => ProfileProvider());
