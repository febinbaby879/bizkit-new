import 'dart:developer';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/card_second/card_second_create_request_model/card_second_create_request_model.dart';
import 'package:bizkit/domain/model/card_second/card_second_response_model/card_second_response_model.dart';
import 'package:bizkit/domain/model/card_second/gate_all_card_second_model/gate_all_card_second_model.dart';
import 'package:bizkit/domain/model/card_second/get_second_card_model/get_second_card_model.dart';
import 'package:bizkit/domain/model/card_second/update_second_card_model/update_second_card_model.dart';
import 'package:bizkit/domain/repository/service/card_second.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CardSecondRepo)
@injectable
class CardSecondService implements CardSecondRepo {
  final ApiService _apiService;

  CardSecondService(this._apiService);
  @override
  Future<Either<Failure, CardSecondResponseModel>> cardSecondCreation(
      {required CardSecondCreateRequestModel
          cardSecondCreateRequestModel}) async {
    try {
      log('cardSecondCreation  ${cardSecondCreateRequestModel.toJson()}');
      final responce = await _apiService.post(
        ApiEndPoints.createSecondCard,
        data: cardSecondCreateRequestModel.toJson(),
      );
      log('cardSecondCreation done');
      return Right(CardSecondResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('cardSecondCreation dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure(message: 'Failed to create card please try again'));
    } catch (e) {
      log('cardSecondCreation exception error');
      log(e.toString());
      return Left(Failure(message: 'Failed to create card please try again'));
    }
  }

  @override
  Future<Either<Failure, GetSecondCardModel>> getCardSecond() async {
    try {
      final responce = await _apiService.get(ApiEndPoints.getAllCardSecond);
      log('getCardSecond data ${responce.data}');
      return Right(GetSecondCardModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getCardSecond dio error $e');
      return Left(Failure(message: 'Failed to get card please try again'));
    } catch (e) {
      log('getCardSecond exception error');
      log(e.toString());
      return Left(Failure(message: 'Failed to get card please try again'));
    }
  }

  @override
  Future<Either<Failure, CardSecondResponseModel>> updateCardSecond({
    required UpdateSecondCardModel updateSecondCardModel,
  }) async {
    try {
      final responce = await _apiService.get(ApiEndPoints.createReminder);
      log('updateCardSecond data ${responce.data}');
      return Right(CardSecondResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('updateCardSecond dio error $e');
      return Left(Failure(message: 'Failed to get card please try again'));
    } catch (e) {
      log('updateCardSecond exception error');
      log(e.toString());
      return Left(Failure(message: 'Failed to get card please try again'));
    }
  }

  @override
  Future<Either<Failure, GateAllCardSecondModel>> getAllCardsSecond() async{
    try {
      final responce = await _apiService.get(ApiEndPoints.createReminder);
      log('getAllCardsSecond data ${responce.data}');
      return Right(GateAllCardSecondModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllCardsSecond dio error $e');
      return Left(Failure(message: 'Failed to get card please try again'));
    } catch (e) {
      log('getAllCardsSecond exception error');
      log(e.toString());
      return Left(Failure(message: 'Failed to get card please try again'));
    }
  }
}
