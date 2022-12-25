import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/pages/page/login/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'component/validationform.dart';
import 'auth/auth_bloc.dart';
import 'component/btn_frave.dart';
import 'component/text_form_frave.dart';
import 'component/text_frave.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final _keyForm = GlobalKey<FormState>();
  bool isChangeSuffixIcon = true;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.clear();
    _usernameController.dispose();
    _passwordController.clear();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if( state is LoadingAuthState ){
          Navigator.pop(context);
          // modalLoading(context, 'Checking...');
        }else if( state is FailureAuthState ){
          Navigator.pop(context);
          // errorMessageSnack(context, state.error);
        }else if( state is SuccessAuthState ){
          Navigator.pop(context);
          UserBloc().add(OnGetUserEvent());
          Navigator.of(context).pushNamed(AppRoutes.screen);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.close_rounded, size: 25, color: Colors.white),
            onPressed: ()=> Navigator.pop(context),
          ),
          actions: [
            TextButton(
              child: const Text('Register'),
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.register),
            ),
            SizedBox(width: 5)
          ],
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Form(
            key: _keyForm,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              physics: const BouncingScrollPhysics(),
              children: [
                const TextFrave(text: 'Welcome to Ecommerce', fontSize: 24, fontWeight: FontWeight.w600),
                const SizedBox(height: 5.0),
                const TextFrave(text: 'Login Account', fontSize: 17),
                const SizedBox(height: 20.0),
                TextFormFrave(
                  hintText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  controller: _usernameController,
                  validator: RequiredValidator(errorText: 'Username is required'),
                ),
                const SizedBox(height: 20),
                TextFormFrave(
                  controller: _passwordController,
                  isPassword: isChangeSuffixIcon,
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.password_rounded),
                  validator: passwordValidator,
                ),
                const SizedBox(height:  40),

                BtnFrave(
                  text: 'Sign in',
                  width: size.width,
                  fontSize: 20,
                  onPressed: (){
                    if( _keyForm.currentState!.validate() ){
                      AuthBloc().add(LoginEvent(_usernameController.text.trim(), _passwordController.text.trim()));
                    }
                  },
                ),

                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      child: const TextFrave(text: 'Forgot password?', color: Colors.black, fontSize: 17),
                      onPressed: () => Navigator.of(context).pushNamed(AppRoutes.screen),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
