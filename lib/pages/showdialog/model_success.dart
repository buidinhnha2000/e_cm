import 'package:flutter/material.dart';
import '../page/login/component/color_frave.dart';
import '../page/login/component/text_frave.dart';

void modalSuccess(BuildContext context, String text, {required VoidCallback onPressed}){
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black12,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: SizedBox(
          height: 200,
          child: Column(
            children: [
              Container(
                  height: 90,
                  width: 90,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          colors: [
                            Colors.white,
                            ColorsFrave.primaryColorFrave
                          ]
                      )
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsFrave.primaryColorFrave
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 38),
                  )
              ),
              const SizedBox(height: 35.0),
              TextFrave(text: text, fontSize: 17, fontWeight: FontWeight.w400 ),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: onPressed,
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: ColorsFrave.primaryColorFrave,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: const TextFrave(text: 'Done', color: Colors.white, fontSize: 17 ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}