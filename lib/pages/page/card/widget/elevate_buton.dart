import 'dart:developer';
import 'package:flutter/material.dart';

class ElevateButon extends StatefulWidget {
  final Function()? onPressed;
  final String text;
  final Color color;
  final IconData icon;

  const ElevateButon(
      {Key? key,
        required this.onPressed,
        required this.text,
        required this.color,
        required this.icon})
      : super(key: key);

  @override
  _ElevateButonState createState() => _ElevateButonState();
}

class _ElevateButonState extends State<ElevateButon> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
      (_isLoading || widget.onPressed == null) ? null : _loadFuture,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(top: 1, bottom: 1),
          backgroundColor: Colors.white,
          shape: const StadiumBorder()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: widget.color
              )
            ),
          ),
          Icon(
            Icons.navigate_next,
            color: widget.color,
            size: 15,
          )
        ],
      ),
    );
  }

  Future<void> _loadFuture() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed!();
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
