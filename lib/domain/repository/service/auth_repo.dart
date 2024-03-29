import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/auth/change_password_model/change_password_model.dart';
import 'package:bizkit/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/domain/model/auth/login_model/login_model.dart';
import 'package:bizkit/domain/model/auth/login_response_model/login_response_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_indivudal_model/sign_up_indivudal_model.dart';
import 'package:bizkit/domain/model/auth/sign_up_model/sign_up_model.dart';
import 'package:bizkit/domain/model/auth/verify_otp_model/verify_otp_model.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponseModel>> login(
      {required LoginModel loginModel});
  Future<Either<Failure, LoginResponseModel>> registerBusiness(
      {required SignUpModel signUpModel});
  Future<Either<Failure, LoginResponseModel>> registerIndivudual(
      {required SignUpIndivudalModel signUpIndivudalModel});
  Future<Either<Failure, SuccessResponseModel>> sendOtp(
      {required EmailModel emailModel});
  Future<Either<Failure, SuccessResponseModel>> verifyOtp(
      {required VerifyOtpModel verifyOtpModel});
  Future<Either<Failure, SuccessResponseModel>> forgotPassword(
      {required EmailModel emailModel});
  Future<Either<Failure, SuccessResponseModel>> verifyOtpForgotPassword(
      {required VerifyOtpModel verifyOtpModel});
  Future<Either<Failure, SuccessResponseModel>> changePassword(
      {required ChangePasswordModel changePasswordModel});
}
