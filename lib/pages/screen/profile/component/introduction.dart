
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'E Commerce Introduction',
          )),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "How do i Sign up?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "1. Sign up through our Google Form Sign Up link: ",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                const Text(
                  "http://buidinhnha/ecommerce.com/login",
                  style: TextStyle(color: Colors.redAccent, fontSize: 17),
                ),
                const Text(
                  "Signing up is quick and easy! Register using your phone number or"
                      " email address or use your existing Ecommerce account. You need"
                      " to verify your phone number or email address before you can ch"
                      "oose your username and password.You can then access your Ecommerce "
                      "account using any of the following credentials with your Ecommerce password:",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                const Text(
                  "    - Ecommerce Username",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                const Text(
                  "    - Phone Password",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                const Text(
                  "    - Email username",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                Center(
                    child: Image.asset(
                      'assets/images/image3.jpg',
                      fit: BoxFit.cover,
                      height: 300,
                      width: 200,
                    )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Our people define us",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sea shall be a place where talented people thrive at scale, enjoy freedom of ideas, and achieve the unimaginable. It shall be a magnet for the smartest, the most creative, and the most driven.",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Our products and services differentiate us",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "We aspire to better every life we touch and make the world "
                      "an even more connected community through innovative products and services.",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Our institution will outlast us",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "We strive to build an institution that will last for generations and evolve with time and that is founded upon our core values.",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Row()
          ],
        ),
      ),
    );
  }
}
