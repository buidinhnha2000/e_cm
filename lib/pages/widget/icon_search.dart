
import 'package:e_cm/app/navigator/router.dart';
import 'package:flutter/material.dart';

class IconSearch extends StatefulWidget {
  const IconSearch({super.key, required this.color});

  final Color color;

  @override
  State<IconSearch> createState() => _IconSearchState();
}

class _IconSearchState extends State<IconSearch> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildInputSearch(

      ),
    );
  }
  _buildInputSearch() {
    const sizeIcon = BoxConstraints(minWidth: 40, minHeight: 40);
    const border = OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white54,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
    );

    return Expanded(
      child: TextField(
        onTap: (){
          Navigator.of(context).pushNamed(AppRoutes.search);

        },
        focusNode: FocusScopeNode(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(4),
          enabledBorder: border,
          focusedBorder: border,
          isDense: true,
          hintText: "Searching",
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.deepOrange,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 25,
          ),
          prefixIconConstraints: sizeIcon,
          // suffixIcon:
          // const Icon(Icons.camera_alt, color: Colors.white, size: 25),
          suffixIconConstraints: sizeIcon,
          filled: true,
          fillColor: widget.color,

        ),
      ),
    );
  }
}