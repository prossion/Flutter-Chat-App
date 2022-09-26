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
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: const TextStyle(color: whiteTextStyle),
        border: InputBorder.none,
        prefixIcon: InkWell(
            onTap: () {
              widget.isSearch();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Icon(
                Icons.arrow_back,
                size: 25,
                color: whiteTextStyle,
              ),
            )),
        // enabledBorder: const UnderlineInputBorder(
        //     //Default TextField border
        //     borderSide: BorderSide(color: Colors.white)),
        // focusedBorder: const UnderlineInputBorder(
        //     //Borders when a TextField is in focus
        //     borderSide: BorderSide(color: Colors.white)),
      ),
      textInputAction: TextInputAction.search,
      style: const TextStyle(fontSize: 20.0, color: whiteTextStyle),
    );
  }
}
