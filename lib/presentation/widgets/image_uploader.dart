import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageUploader extends ConsumerWidget {
  final String? imageUrl;
  final String label;
  final double height;
  final ValueSetter<String>? onImageUploaded;

  const ImageUploader(
    this.imageUrl, {
    super.key,
    this.onImageUploaded,
    required this.label,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                // Фоновое изображение или цвет
                if (hasImage)
                  Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: colorScheme.onSurfaceVariant);
                    },
                  )
                else
                  Container(color: colorScheme.onSurfaceVariant),

                // Кнопка с эффектом смазанности
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: InkWell(
                      onTap: () {},
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                            ),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
