import 'dart:developer';

import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/qr/create_qr_model/create_qr_model.dart';
import 'package:bizkit/domain/model/qr/qr_response/qr_response.dart';
import 'package:bizkit/domain/repository/service/qr_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QrServiceRepo)
@injectable
class QRServiceImpl implements QrServiceRepo{
  final ApiService apiService;

  QRServiceImpl(this.apiService);

  @override
  Future<Either<Failure, QrResponse>> getUpdatedQr(
      {required CreateQrModel createQrModel}) async {
    try {
      final response = await apiService.post(ApiEndPoints.getQr,
          data: createQrModel.toJson());
      return Right(QrResponse.fromJson(response.data));
    } on DioException catch (e) {
      log('getQR dioExcepton = > ${e.toString()}');
      if (e.response?.statusCode == 500) {
        return Left(Failure(message: errorMessage));
      } else {
        return Left(
            Failure(message: e.response?.data['error'] ?? errorMessage));
      }
    } catch (e) {
      log('getQR exception = > ${e.toString()}');
      return Left(Failure(message: errorMessage));
    }
  }
}