
import 'package:e_cm/pages/screen/login_screen/login.dart';
import 'package:flutter/material.dart';

class IconSetting extends StatelessWidget {
  const IconSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => LoginScreen()));
        },
        icon: const Icon(
          Icons.settings_outlined,
          size: 28,
        ));
  }
}
