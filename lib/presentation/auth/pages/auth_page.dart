import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/common/widgets/basic_app_bar.dart';
import 'package:music_player/common/widgets/basic_app_button.dart';
import 'package:music_player/core/config/assets/app_assets.dart';
import 'package:music_player/common/utils/utils.dart' as util;
import 'package:music_player/core/config/theme/app_colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDarkMode;

    TextStyle textStyleLarge = TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: isDark ? Colors.white : Colors.black,
    );

    TextStyle textStyleSmall = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.grey,
    );

    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBg,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppVectors.logo),
                const SizedBox(height: 40),
                Text(
                  "Enjoy Listening To Music",
                  style: textStyleLarge,
                ),
                const SizedBox(height: 21),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua labore et dolore magna aliqua.',
                  style: textStyleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: BasicAppButton(
                        title: "Sign up",
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: BasicAppButton(
                        onPressed: () {},
                        title: "Sign in",
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          foregroundColor: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
