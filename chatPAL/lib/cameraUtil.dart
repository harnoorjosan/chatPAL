
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class cameraUtil {
  static Future<File?> openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    // Process the picked image file as needed
    if (pickedFile != null) {
      // Handle the picked image file
      // ...
      File imageFile = File(pickedFile.path);
      return imageFile;
    }
    return null;
  }

  static Future<File?> openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    // Process the picked image file as needed
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      return imageFile;
    }
    return null;

  }
}