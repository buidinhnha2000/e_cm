part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final User? user;

  const UserState({this.user});
}

class UserInitial extends UserState {}

class SetUserState extends UserState {
  final User idUser;

  SetUserState(this.idUser);
}

class LoadingUserState extends UserState {}

class SuccessUserState extends UserState {
  final User user;
  const SuccessUserState(this.user);
}

class FailureUserState extends UserState {
  final error;

  const FailureUserState(this.error);
}
