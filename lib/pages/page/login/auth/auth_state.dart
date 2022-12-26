part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LogOutState extends AuthState {}

class SuccessAuthState extends AuthState {
  final User user;
  SuccessAuthState(this.user);
}

class LoadingAuthState extends AuthState {}

class FailureAuthState extends AuthState {
  final String error;

  FailureAuthState(this.error);
}
