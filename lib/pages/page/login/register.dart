import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/pages/page/login/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'component/validationform.dart';
import 'component/btn_frave.dart';
import 'component/color_frave.dart';
import 'component/text_form_frave.dart';
import 'component/text_frave.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController userController;
  late TextEditingController passwordController;
  late TextEditingController passController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userController = TextEditingController();
    passwordController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  // @override
  // void dispose() {
  //   clear();
  //   userController.dispose();
  //   passwordController.dispose();
  //   passController.dispose();
  //   super.dispose();
  // }
  //
  // void clear() {
  //   userController.clear();
  //   passwordController.clear();
  //   passController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
        }
        if (state is SuccessUserState) {
          Navigator.of(context).pushNamed(AppRoutes.screen);
        }
        if (state is FailureUserState) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            TextButton(
              child: const TextFrave(
                  text: 'Log In',
                  fontSize: 17,
                  color: ColorsFrave.primaryColorFrave),
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.login),
            ),
            const SizedBox(width: 5)
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            children: [
              const TextFrave(
                  text: 'Welcome to Ecommerce',
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
              const SizedBox(height: 5.0),
              const TextFrave(text: 'Create Account', fontSize: 17),
              const SizedBox(height: 20.0),
              TextFormFrave(
                hintText: 'Username',
                prefixIcon: const Icon(Icons.person),
                controller: userController,
                validator: RequiredValidator(errorText: 'Username is required'),
              ),
              const SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.vpn_key_rounded),
                isPassword: true,
                controller: passwordController,
                validator: passwordValidator,
              ),
              const SizedBox(height: 15.0),
              TextFormFrave(
                  hintText: 'Repeat Password',
                  controller: passController,
                  prefixIcon: const Icon(Icons.vpn_key_rounded),
                  isPassword: true,
                  validator: (val) =>
                      MatchValidator(errorText: 'Password do not macth ')
                          .validateMatch(val!, passwordController.text)),
              const SizedBox(height: 25.0),
              Row(
                children: const [
                  Icon(Icons.check_circle_rounded, color: Color(0xff0C6CF2)),
                  TextFrave(
                    text: ' I Agree to Ecommerce ',
                    fontSize: 15,
                  ),
                  TextFrave(
                      text: ' Terms of Use',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent),
                ],
              ),
              const SizedBox(height: 25.0),
              BtnFrave(
                text: 'Sign Up',
                width: size.width,
                fontSize: 20,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    userBloc.add(OnAddNewUser(
                      userController.text.trim(),
                      passwordController.text.trim(),
                    ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
