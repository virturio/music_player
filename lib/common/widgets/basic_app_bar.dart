import 'package:flutter/material.dart';
import 'package:music_player/common/utils/utils.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
    this.title,
    this.centerTitle = false,
    this.hideLeading = false,
  });

  final Widget? title;
  final bool hideLeading;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDarkMode;

    return AppBar(
      title: title,
      centerTitle: centerTitle,
      leading: !hideLeading
          ? IconButton(
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
            )
          : null,
    );
  }
}
