abstract class DataBaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<dynamic> getData({
    required String path,
     String? documentId,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });

  Stream<dynamic> streamData({
    required String path,
    Map<String, dynamic>? query,
  });

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
}
