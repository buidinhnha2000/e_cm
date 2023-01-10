part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class OnAddNewUser extends UserEvent {
  final String username;
  final String password;
  final String email;

  OnAddNewUser(this.email, this.username, this.password);
}

class OnGetUserEvent extends UserEvent {
}


