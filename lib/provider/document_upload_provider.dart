import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/constants/constants.dart';
import 'package:frontend_vendor/model/document_state_model.dart';
import 'package:frontend_vendor/services/document_service.dart';
import 'package:image_picker/image_picker.dart';

final defaultState = DocumentState(
    isError: false,
    isLoading: false,
    error: '',
    isSuccess: false,
    panCard: null);

class DocumentUploadProvider extends StateNotifier<DocumentState> {
  DocumentUploadProvider() : super(defaultState);

  void updatePanCard(File? file) {
    state = state.copyWith(panCard: file);
  }

  void updateCitizenShip(File? file) {
    state = state.copyWith(citizenship: file);
  }

  void updateDrivingLiscence(File? file) {
    state = state.copyWith(drivingLiscence: file);
  }

  void setNull(String propertyName) {
    state = state.setPropertyToNull(propertyName);
  }

  Future<void> submitDocuments({
    required Function onSucess,
    required Function onError,
  }) async {
    bool isError=false;
    DocumentService documentService = DocumentService();
    state = state.copyWith(isLoading: true);
    final panResponse = await documentService.uploadFile(
        file: state.panCard!, type: "pancard", url: UrlConstants.addPanCard);
    panResponse.fold(
        (l) => {
              isError=false,
            },
        (r) {
          isError=true;
        });
    final citizenshipResponse = await documentService.uploadFile(
        file: state.citizenship!,
        type: "citizenship",
        url: UrlConstants.addCitizenship);
    citizenshipResponse.fold(
        (l) => {
              isError=false,
            },
        (r) {
          isError=true;
        });
        if(isError){
          onError();}
          else{
            onSucess();
          }

    state = state.copyWith(isLoading: false);
  }

  Future<void> captureImage({
    bool isCamera = false,
    required Function(File file) onSucess,
  }) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      File? img = File(pickedImage.path);
      onSucess(img);
    }
  }
}

final documentUploadProvider =
    StateNotifierProvider<DocumentUploadProvider, DocumentState>(
        (ref) => DocumentUploadProvider());
