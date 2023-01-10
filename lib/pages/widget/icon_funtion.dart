import 'package:flutter/material.dart';


class IconFuntion extends StatefulWidget {
  const IconFuntion(
      {super.key,
        required this.color,
        required this.icon,
        required this.onPress, required this.notification});

  final Color color;
  final IconData icon;
  final VoidCallback onPress;
  final int notification;

  @override
  State<IconFuntion> createState() => _IconFuntionState();
}

class _IconFuntionState extends State<IconFuntion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildIconButton(
        onPressed: () {},
        icon: widget.icon,
        notification: widget.notification,
      ),
    );
  }

  _buildIconButton(
      {required VoidCallback onPressed,
        required IconData icon,
        int notification = 0}) =>
      Stack(
        children: [
          IconButton(
            onPressed: widget.onPress,
            icon: Icon(icon),
            color: widget.color,
            iconSize: 28,
          ),
          notification == 0
              ? const SizedBox()
              : Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.redAccent[400],
                  border: Border.all(color: Colors.white),
                ),
                constraints: const BoxConstraints(
                  minHeight: 22,
                  minWidth: 22,
                ),
                child: Text(
                  '$notification',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      );
}