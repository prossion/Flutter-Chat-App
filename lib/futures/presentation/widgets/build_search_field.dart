import 'package:flutter/material.dart';

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
    return Container(
      margin: const EdgeInsets.only(top: 65),
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 1,
              offset: const Offset(0, 0.50))
        ],
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          prefixIcon: InkWell(
              onTap: () {
                widget.isSearch();
              },
              child: const Icon(
                Icons.arrow_back,
                size: 25,
              )),
        ),
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
