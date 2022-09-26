import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    this.controller,
    this.validator,
    required this.hintText,
    required this.type,
    this.suffixIcon,
    this.prefixIcon,
    this.autovalidateMode,
    required this.obscureText,
  }) : super(key: key);
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final AutovalidateMode? autovalidateMode;
  final String hintText;
  final TextInputType type;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      keyboardAppearance: Theme.of(context).brightness,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: Icon(prefixIcon),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      autovalidateMode: autovalidateMode,
      validator: validator,
      obscureText: obscureText,
    );
  }
}
