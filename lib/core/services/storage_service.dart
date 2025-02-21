import 'dart:io';

abstract class StorageService {
  Future<String> uploadImage(String path, File file);
}