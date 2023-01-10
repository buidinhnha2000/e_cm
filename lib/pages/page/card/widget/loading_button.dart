import 'dart:developer';
import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final Future Function()? onPressed;
  final String text;
  final Color color;
  final String? img;

  const LoadingButton(
      {Key? key,
        required this.onPressed,
        required this.text,
        required this.color,
        required this.img})
      : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(widget.color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
              onPressed:
              (_isLoading || widget.onPressed == null) ? null : _loadFuture,
              child: _isLoading
                  ? const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.cyanAccent,
                  ))
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.img != null
                      ? Container(
                      padding: const EdgeInsets.only(bottom: 2),
                      height: 20,
                      width: 18,
                      child: Image.asset(
                        widget.img ?? '',
                        color: Colors.black,
                        fit: BoxFit.fill,
                      ))
                      : const Text(''),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    widget.text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 22
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error $e')));
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
