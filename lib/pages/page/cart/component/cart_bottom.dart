import 'package:flutter/material.dart';

class CartBottom extends StatefulWidget {
  const CartBottom({Key? key}) : super(key: key);

  @override
  State<CartBottom> createState() => _CartBottomState();
}

class _CartBottomState extends State<CartBottom> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return BottomAppBar(
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  height: 60,
                  color: Colors.black45,
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text("All", style: TextStyle(fontSize: 17),)
                    ],
                  )
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                  height: 60,
                  color: Colors.black45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Total :", style: TextStyle(fontSize: 17),),
                      SizedBox(width: 5,),
                      Text("189324 USD", style: TextStyle(fontSize: 17, color: Colors.deepOrange),)
                    ],
                  )),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    height: 60,
                    color: Colors.deepOrange[600],
                    child: const Center(
                      child: Text(
                        'Mua hang',
                        style: TextStyle(fontSize: 17),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
