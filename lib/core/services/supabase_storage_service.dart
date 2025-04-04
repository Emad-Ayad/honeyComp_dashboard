import 'dart:io';

import 'package:honey_comp_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

import '../constants/constants.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBucket(String bucketName) async {
    bool isBucketExist = false;
    var buckets = await _supabase.client.storage.listBuckets();
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (!isBucketExist) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kISupaBaseUrl,
      anonKey: kISupaBaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = p.basename(file.path);
    String extension = p.extension(file.path);
     await _supabase.client.storage
        .from('honey_images')
        .upload('$path/$fileName.$extension', file);
    final String imageIrl = _supabase.client.storage
        .from('honey_images')
        .getPublicUrl('$path/$fileName.$extension');
    return imageIrl;
  }
}
