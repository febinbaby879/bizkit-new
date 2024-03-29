part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLoading,
    required bool hasError,
    required bool otpSend,
    required bool otpVerificationError,
    required bool otpVerifiedForgotPassword,
    required bool isLogin,
    String? message,
    String? userName,
    required bool hasCard,
    required bool isFirstLogin,
    LoginResponseModel? loginResponseModel,
  }) = _Initial;

  factory AuthState.initial() => const AuthState(
        isLoading: false,
        hasError: false,
        otpSend: false,
        isFirstLogin: true,
        hasCard: true,
        userName: '',
        otpVerificationError: false,
        isLogin: false,
        otpVerifiedForgotPassword: false,
      );
}
