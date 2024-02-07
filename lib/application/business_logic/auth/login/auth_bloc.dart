import 'dart:async';
import 'package:bizkit/application/presentation/utils/constants/contants.dart';
import 'package:bizkit/data/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/data/sqflite/sqflite_local_service.dart';
import 'package:bizkit/domain/model/auth/change_password_model/change_password_model.dart';
import 'package:bizkit/domain/model/auth/email_model/email_model.dart';
import 'package:bizkit/domain/model/auth/login_model/login_model.dart';
import 'package:bizkit/domain/model/auth/login_response_model/login_response_model.dart';
import 'package:bizkit/domain/model/auth/verify_otp_model/verify_otp_model.dart';
import 'package:bizkit/domain/model/token/token_model.dart';
import 'package:bizkit/domain/repository/service/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  final LocalService localService;

  AuthBloc(this.authRepo, this.localService) : super(AuthState.initial()) {
    on<Login>(login);
    on<ForgotPassword>(forgotPassword);
    on<ChangePassword>(changePassword);
    on<VerifyforgotPassword>(verifyForgotPassword);
    on<Log>(log);
  }

  FutureOr<void> log(Log event, emit) async =>
      emit(state.copyWith(isLogin: await SecureStorage.getLogin()));

  FutureOr<void> login(Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
        loginResponseModel: null));
    final result = await authRepo.login(loginModel: event.loginModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      ),
      (loginResponseModel) async {
        emit(
          state.copyWith(
            isLoading: false,
            loginResponseModel: loginResponseModel,
            message: loginResponseModel.message ?? 'login successfully',
          ),
        );
        print('saveToken');
        await SecureStorage.saveToken(
          tokenModel: TokenModel(
              accessToken: loginResponseModel.accessToken,
              refreshToken: loginResponseModel.refreshToken),
        );
        print('sqflite');
        if (loginResponseModel.user != null) {
          await localService.addUser(loginResponseModel.user!);
        }
        print('setLogin');
        await SecureStorage.setLogin();
        print('logged in done');
      },
    );
  }

  FutureOr<void> forgotPassword(
      ForgotPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        message: null,
        hasError: false,
        otpVerificationError: false,
        otpSend: false));
    final result = await authRepo.forgotPassword(emailModel: event.emailModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      ),
      (successResponseModel) => emit(
        state.copyWith(
            isLoading: false,
            message: successResponseModel.message,
            otpSend: true),
      ),
    );
  }

  FutureOr<void> verifyForgotPassword(
      VerifyforgotPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        isLoading: true,
        message: null,
        otpVerificationError: false,
        hasError: false,
        otpSend: false,
        otpVerifiedForgotPassword: false));
    final result = await authRepo.verifyOtpForgotPassword(
        verifyOtpModel: event.verifyOtpModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
            otpVerificationError: true,
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      ),
      (successResponseModel) => emit(
        state.copyWith(
            isLoading: false,
            message: successResponseModel.message,
            otpVerifiedForgotPassword: true),
      ),
    );
  }

  FutureOr<void> changePassword(
      ChangePassword event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
          isLoading: true,
          message: null,
          hasError: false,
          otpVerificationError: false),
    );
    final result = await authRepo.changePassword(
        changePasswordModel: event.changePasswordModel);
    result.fold(
      (failure) => emit(
        state.copyWith(
            isLoading: false,
            hasError: true,
            message: failure.message ?? errorMessage),
      ),
      (successResponseModel) => emit(
        state.copyWith(isLoading: false, message: successResponseModel.message),
      ),
    );
  }
}