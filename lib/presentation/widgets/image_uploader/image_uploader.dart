import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'image_uploader_controller.dart';

class ImageUploader extends ConsumerWidget {
  final String? imageUrl;
  final String label;
  final double height;
  final ValueSetter<String>? onImageUploaded;

  const ImageUploader({
    super.key,
    this.imageUrl,
    this.onImageUploaded,
    required this.label,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(imageUploaderControllerProvider(onImageUploaded));

    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
    final borderRadius = BorderRadius.circular(14);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: height,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Фоновое изображение
                _buildBackground(hasImage, colorScheme, imageUrl),

                // Кнопка загрузки
                Center(
                  child: _buildUploadButton(hasImage, controller),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBackground(bool hasImage, ColorScheme scheme, String? url) {
    return hasImage
        ? Image.network(
            url!,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, progress) => progress == null
                ? child
                : const Center(child: CircularProgressIndicator()),
            errorBuilder: (_, __, ___) =>
                Container(color: scheme.onSurfaceVariant),
          )
        : Container(color: scheme.onSurfaceVariant);
  }

  Widget _buildUploadButton(bool hasImage, ImageUploaderController controller) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: controller.pickAndUploadImage,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Text(
              hasImage ? 'Заменить' : 'Загрузить',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
