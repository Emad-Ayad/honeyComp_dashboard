import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:honey_comp_dashboard/core/errors/failure.dart';
import 'package:honey_comp_dashboard/core/helper/backend_endpoints.dart';
import 'package:honey_comp_dashboard/core/repoes/upload_image_repo/upload_img_repo.dart';
import 'package:honey_comp_dashboard/core/services/storage_service.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;

  ImageRepoImpl({required this.storageService});

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await storageService.uploadFile(image, BackendEnpPoints.images);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(errMessage: "Error in Uploading Image"));
    }
  }
}
