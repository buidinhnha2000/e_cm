import 'package:e_cm/auth/authentication_repository/authentication_repository.dart';
import 'package:e_cm/auth/authentication_repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();


  runApp(App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
  ));
}