import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {

  final storageReference = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file, String path) async {

    String fileName = b.basename(file.path);
    String extension = b.extension(file.path);
    
    var fileReference = storageReference.child('$path/$fileName.$extension');

    await fileReference.putFile(file);

    var fileUrl = await fileReference.getDownloadURL();

    return fileUrl;
  }

}