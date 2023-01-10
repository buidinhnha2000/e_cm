import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/user/user.dart';
import '../../../../data/network/services/user_services.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<OnAddNewUser>(_onRegister);
  }

  Future<void> _onRegister(OnAddNewUser event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());
      final user = await userServices.register(event.username, event.password, event.email);
      await secureStorage.saveUserId(user.userId);
      emit(SuccessUserState(user));
    } catch (e) {
      print(e);
      emit(FailureUserState(e.toString()));
    }
  }

}
