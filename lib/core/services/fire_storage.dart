import 'dart:io';

import 'package:honey_comp_dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

// Don't need it anymore but it was nice one
class FireStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(
    File file,
    String path,
  ) async {
    try {
      if (!await file.exists()) {
        throw Exception('File does not exist');
      }
      String fileName = p.basename(file.path);
      String extension = p.extension(file.path);
      var imageRef = storageRef.child('$path/$fileName.$extension');
      await imageRef.putFile(file);
      var imageUrl = imageRef.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      throw Exception('Firebase upload failed: ${e.message}');
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }
}
