import 'package:flutter/material.dart';
import 'package:music_player/common/utils/utils.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDarkMode;
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.maybePop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(.03)
                : Colors.black.withOpacity(.03),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
        ),
      ),
    );
  }
}
