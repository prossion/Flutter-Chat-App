import 'package:flutter/material.dart';
import 'package:flutter_social_app/config/app_theme.dart';

class BuildSearchField extends StatefulWidget {
  const BuildSearchField({
    Key? key,
    required this.controller,
    required this.isSearch,
  }) : super(key: key);

  final TextEditingController controller;
  final Function isSearch;

  @override
  State<BuildSearchField> createState() => _BuildSearchFieldState();
}

class _BuildSearchFieldState extends State<BuildSearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: whiteTextStyle,
      autofocus: true,
      keyboardAppearance: Theme.of(context).brightness,
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: const TextStyle(color: whiteTextStyle),
        border: InputBorder.none,
        prefixIcon: InkWell(
            onTap: () {
              widget.isSearch();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.arrow_back,
                size: 25,
                color: whiteTextStyle,
              ),
            )),
      ),
      textInputAction: TextInputAction.search,
      style: const TextStyle(fontSize: 20.0, color: whiteTextStyle),
    );
  }
}
