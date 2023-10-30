import 'package:flutter/material.dart';

import 'appfont.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
  });

  final Function() onPressed;
  final String text;
  final MaterialStateProperty<Color?>? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: color ??
            Theme.of(context).elevatedButtonTheme.style!.backgroundColor,
      ),
      child: Appfont(
        text,
        size: 15,
        color: Colors.white,
      ),
    );
  }
}
