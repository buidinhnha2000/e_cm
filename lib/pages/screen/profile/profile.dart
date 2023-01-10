import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/pages/page/login/auth/auth_bloc.dart';
import 'package:e_cm/pages/screen/profile/component/profile_function.dart';
import 'package:e_cm/pages/screen/profile/component/profile_header.dart';
import 'package:e_cm/pages/screen/profile/component/profile_list.dart';
import 'package:e_cm/pages/screen/profile/component/profile_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogOutState) {
          Navigator.of(context).pushNamed(AppRoutes.login);
        }
      },
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          children: const [
            ProfileHeader(),
            SizedBox(
              height: 5,
            ),
            ProfileProduct(),
            SizedBox(
              height: 5,
            ),
            ProfileList(),
            SizedBox(
              height: 5,
            ),
            ProfileFunction(),

          ],
        ),
      )
    );
  }
}
