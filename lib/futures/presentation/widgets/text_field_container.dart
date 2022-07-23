import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final TextEditingController? controller;
  final bool? isObscureText;
  final String? hintText;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  const TextFieldContainer(
      {Key? key,
      this.keyboardType,
      this.prefixIcon,
      this.hintText,
      this.controller,
      this.isObscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextField(
        obscureText: isObscureText == true ? true : false,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon ?? Icons.circle),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
