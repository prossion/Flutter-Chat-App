import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final String title;
  final String text;
  const ErrorDisplay({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DelayedDisplay(
        delay: const Duration(seconds: 1),
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            // color: const Color(0xffffc5c2),
            decoration: const BoxDecoration(
                color: Color(0xffffdbd9),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x10000000),
                    spreadRadius: 3,
                    offset: Offset(3, 3),
                    blurRadius: 3,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 70),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: 0.0,
                        color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
