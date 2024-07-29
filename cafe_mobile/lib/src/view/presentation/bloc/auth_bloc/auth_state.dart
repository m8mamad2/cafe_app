part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthStateInitial extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateSuccess extends AuthState {}

final class AuthStateFail extends AuthState {
  final String? error;
  AuthStateFail(this.error);
}
