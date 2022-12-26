import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/user/user.dart';
import '../../../../data/network/services/user_services.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<OnAddNewUser>(_onRegister);
    // on<OnGetUserEvent>(_getUser);
  }

  Future<void> _onRegister(OnAddNewUser event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final user = await userServices.register(event.username, event.password);

      await secureStorage.saveUserId(user.idUser!);
      emit(SuccessUserState(user));
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  // Future<void> _getUser(OnGetUserEvent event, Emitter<UserState> emit) async {
    // final data = await secureStorage.getUserId();
    // final resp = await Dio().get('${URLS.urlApi}/auth/login/$data');
    // final List<dynamic> jsonProduct = resp.data as List<dynamic>;
    // final user = jsonProduct.map((e) => User.fromJson(e)).toList();
    // emit(SuccessUserState(user));
  // }

}
