import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height;
  final ButtonStyle? style;

  const BasicAppButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.height,
      this.style});

  @override
  Widget build(BuildContext context) {
    ButtonStyle? style =
        this.style ?? Theme.of(context).elevatedButtonTheme.style;

    return ElevatedButton(
      style: style?.copyWith(
        minimumSize: WidgetStatePropertyAll(
          Size.fromHeight(height ?? 80),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}
