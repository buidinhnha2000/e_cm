import 'dart:async';
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:flutter/material.dart';

import '../../../app/navigator/router.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async{
      final userId = await secureStorage.getUserId();
      if(userId != null) {
        Navigator.of(context).pushNamed(AppRoutes.screen);
      }
      else {
        Navigator.of(context).pushNamed(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logon1.png',
                    height: 50,
                    width: 50,
                    // color: Colors.black,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 5,),
                  const Text(
                    "E commerce",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 200,),
              const Text(''),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 5,
                ),
                SizedBox(height: 100,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
