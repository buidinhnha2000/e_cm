
import 'package:e_cm/pages/page/login/user/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/user/user.dart';
import '../../../../data/network/helper/secure_storage.dart';
import '../../../../data/network/services/auth_services.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()){

    on<LoginEvent>( _login );
    on<CheckLoginEvent>( _checkingLogin );
    on<LogOutEvent>( _logout );
  }


  Future<void> _login(LoginEvent event, Emitter<AuthState> emit ) async {
    try {
      emit(LoadingAuthState());

      final user = await authServices.login(event.username, event.password);

      await secureStorage.saveUserId(user.idUser);
      emit(SuccessAuthState(user));
    } catch (e) {
      emit(FailureAuthState(e.toString()));
    }
    // try {
    //
    //   emit(LoadingAuthState());
    //
    //   final data = await authServices.login(username: event.username, password: event.password);
    //
    //   await Future.delayed(const Duration(milliseconds: 350));
    //
    //   if( data.resp ){
    //
    //     await secureStorage.deleteSecureStorage();
    //
    //     await secureStorage.persistenToken(data.token);
    //
    //     emit(SuccessAuthState());
    //
    //   } else {
    //     emit(FailureAuthState(error: data.message ));
    //   }
    //
    // } catch (e) {
    //   emit(FailureAuthState(error: e.toString()));
    // }

  }


  Future<void> _checkingLogin( CheckLoginEvent event, Emitter<AuthState> emit ) async {

    // try {
    //
    //   emit(LoadingAuthState());
    //
    //   if( await secureStorage.readToken() != null ){
    //
    //     final data = await authServices.renewToken();
    //
    //     if( data.resp ){
    //
    //       await secureStorage.persistenToken(data.token);
    //
    //       emit(SuccessAuthState(user));
    //
    //     }else{
    //       await secureStorage.deleteSecureStorage();
    //       emit(LogOutState());
    //     }
    //
    //   }else{
    //     await secureStorage.deleteSecureStorage();
    //     emit(LogOutState());
    //   }
    //
    // } catch (e) {
    //   await secureStorage.deleteSecureStorage();
    //   emit(LogOutState());
    // }

  }


  Future<void> _logout(LogOutEvent event, Emitter<AuthState> emit) async {

    // secureStorage.deleteSecureStorage();
    emit(LogOutState());
  }
}
