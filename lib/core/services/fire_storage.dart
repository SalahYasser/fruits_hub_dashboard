import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStorage implements StorageService {
  @override
  Future<String> uploadImage(String image) {

    final storageReference = FirebaseStorage.instance.ref();

    // TODO: implement uploadImage
    throw UnimplementedError();
  }

}