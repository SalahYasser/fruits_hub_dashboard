import 'dart:io';
import 'package:path/path.dart' as b;
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/app_api_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {

    var buckets = await _supabase.client.storage.listBuckets();

    bool isBucketExists = false;

    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExists = true;
        break;
      }
    }

    if (!isBucketExists) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extension = b.extension(file.path);

    var result = await _supabase.client.storage
        .from(kBucketName)
        .upload('$path/$fileName.$extension', file);

    return result;
  }
}
