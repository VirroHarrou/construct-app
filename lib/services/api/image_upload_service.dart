import 'dart:io';
import 'package:construct/services/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageUploadServiceProvider = Provider<ImageUploadService>((ref) {
  final dio = ref.watch(dioProvider);
  return ImageUploadService(dio, ImagePicker());
});

class ImageUploadService {
  final Dio dio;
  final ImagePicker picker;

  ImageUploadService(this.dio, this.picker);

  Future<String?> pickAndUploadImage() async {
    final file = await pickImage();
    if (file == null) return null;
    return uploadImage(file);
  }

  Future<File?> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<String> uploadImage(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: 'image_${DateTime.now().millisecondsSinceEpoch}.jpg',
        ),
      });

      final response = await dio.post(
        '/upload',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        final result = (response.data as Map<String, dynamic>)['url'] as String;
        return baseUrl + result;
      } else {
        throw Exception('Failed to upload image: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        final errors = e.response?.data?['detail'] as List<dynamic>?;
        final errorMessage = errors?.isNotEmpty == true
            ? errors?.first['msg'] as String
            : 'Validation error';
        throw Exception('Image upload failed: $errorMessage');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
