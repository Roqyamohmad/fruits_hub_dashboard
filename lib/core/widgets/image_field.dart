import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  Uint8List? webImage; // For web image storage

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            await pickImage();
          } catch (e) {
            isLoading = false;
            setState(() {});
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              width: double.infinity,
              height: 180,
              child: _buildImage(),
            ),
            Visibility(
              visible: fileImage != null || webImage != null,
              child: IconButton(
                onPressed: () {
                  fileImage = null;
                  webImage = null;
                  widget.onFileChanged(null);
                  setState(() {});
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (kIsWeb && webImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.memory(webImage!, fit: BoxFit.cover),
      );
    } else if (!kIsWeb && fileImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(fileImage!, fit: BoxFit.cover),
      );
    } else {
      return const Icon(
        Icons.image_outlined,
        size: 180,
      );
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (kIsWeb) {
        // Convert to Uint8List for web
        webImage = await image.readAsBytes();
        widget.onFileChanged(null); // Web does not use File, so pass null
      } else {
        fileImage = File(image.path);
        widget.onFileChanged(fileImage);
      }
    }
  }
}
