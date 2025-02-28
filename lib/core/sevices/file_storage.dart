import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/sevices/storage_service.dart';
import 'package:path/path.dart' as b;

class FileStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extentionName = b.extension(file.path);
    var filesRef = storageRef.child('$path/$fileName.$extentionName');
    await filesRef.putFile(file);
    var fileUrl = filesRef.getDownloadURL();
    return fileUrl;
  }
}
