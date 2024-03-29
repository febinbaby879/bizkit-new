import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/image/image_model.dart';
import 'package:bizkit/domain/model/scanned_image_datas_model/scanned_image_datas_model.dart';
import 'package:dartz/dartz.dart';

abstract class CardScanningRepo {
  Future<Either<Failure, ScannedImageDatasModel>> processAndSortFromImage(
    List<ImageModel>? processingImages,
  );
}
