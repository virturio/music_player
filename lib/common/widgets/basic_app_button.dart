import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height;

  const BasicAppButton(
      {super.key, required this.title, required this.onPressed, this.height});

  @override
  Widget build(BuildContext context) {
    ElevatedButtonThemeData theme = Theme.of(context).elevatedButtonTheme;

    return ElevatedButton(
      style: theme.style?.copyWith(
        minimumSize: WidgetStatePropertyAll(
          Size.fromHeight(height ?? 80),
        ),
      ),
      onPressed: () {},
      child: Text(
        title,
      ),
    );
  }
}
