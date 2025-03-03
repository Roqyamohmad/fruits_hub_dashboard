import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/sevices/storage_service.dart';
import 'package:fruits_hub_dashboard/core/unitls/backend_endpoint.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;

  ImageRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await storageService.uploadFile(image, BackendEndpoint.images);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure('Failed to uoload image'),
      );
    }
  }
}
