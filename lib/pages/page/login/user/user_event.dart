part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class OnAddNewUser extends UserEvent {
  final String username;
  final String password;

  OnAddNewUser(this.username, this.password);
}

class OnGetUserEvent extends UserEvent {

}
