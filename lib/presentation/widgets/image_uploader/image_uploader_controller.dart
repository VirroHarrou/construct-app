import 'package:construct/services/api/image_upload_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageUploaderControllerProvider = Provider.autoDispose
    .family<ImageUploaderController, ValueSetter<String>?>((ref, onUploaded) {
  final service = ref.watch(imageUploadServiceProvider);
  return ImageUploaderController(service, onUploaded);
});

class ImageUploaderController {
  final ImageUploadService _service;
  final ValueSetter<String>? onUploaded;

  ImageUploaderController(
    this._service,
    this.onUploaded,
  );

  Future<void> pickAndUploadImage() async {
    try {
      final result = await _service.pickAndUploadImage();
      if (result != null && onUploaded != null) {
        onUploaded!(result);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
