import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/user/user.dart';
import '../../../../data/network/helper/secure_storage.dart';
import '../../../../data/network/services/auth_services.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_login);
    on<CheckLoginEvent>(_checkingLogin);
    on<LogOutEvent>(_logout);
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      final user = await authServices.login(event.email, event.password);
      print("user");
      if (user != null ) {
        await secureStorage.saveUserId(user.userId);
        emit(SuccessAuthState(user));
      }
    } catch (e) {
      emit(FailureAuthState(e.toString()));
    }
  }

  Future<void> _checkingLogin(
      CheckLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      if (secureStorage.getUserId() != null) {
        // final user = await authServices.login();
        // emit(SuccessAuthState());
      }
    } catch (e) {
      await secureStorage.deleteSecureStorage();
      emit(LogOutState());
    }
  }

  Future<void> _logout(LogOutEvent event, Emitter<AuthState> emit) async {
    secureStorage.deleteSecureStorage();
    emit(LogOutState());
  }
}
