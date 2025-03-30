import 'dart:io';

import 'package:honey_comp_dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(
    File file,
    String path,
  ) async {
    try {
      // Validate the file
      if (!await file.exists()) {
        throw Exception('File does not exist');
      }
      // Extract filename and extension safely
      final fileName = p.basenameWithoutExtension(file.path);
      final extension =
          p.extension(file.path); // Includes the dot (e.g., ".jpg")
      // Upload to Firebase Storage
      final storageRef =
          FirebaseStorage.instance.ref('$path/$fileName$extension');
      await storageRef.putFile(file);
      // Get the download URL
      return await storageRef.getDownloadURL();
    } on FirebaseException catch (e) {
      throw Exception('Firebase upload failed: ${e.message}');
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }
}
