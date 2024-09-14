import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player/common/widgets/basic_app_button.dart';
import 'package:music_player/core/config/assets/app_assets.dart';
import 'package:music_player/core/config/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/presentation/choose_mode/bloc/theme_qubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    void goTo() {}

    TextStyle textStyleMedium = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    Widget backgroundImage = Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AppImages.chooseModeBg),
        ),
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppVectors.logo),
              const Spacer(),
              Text(
                "Choose Mode",
                style: textStyleMedium,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ThemeModeIcon.asset(
                    assetName: AppVectors.moon,
                    title: "Dark Mode",
                    onTap: () {
                      context.read<ThemeQubit>().updateTheme(ThemeMode.dark);
                    },
                  ),
                  const SizedBox(width: 40),
                  _ThemeModeIcon.asset(
                    assetName: AppVectors.sun,
                    title: "Light Mode",
                    onTap: () {
                      context.read<ThemeQubit>().updateTheme(ThemeMode.light);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              BasicAppButton(
                title: "Continue",
                onPressed: goTo,
              )
            ],
          ),
        ),
      ),
    );

    return Scaffold(body: backgroundImage);
  }
}

class _ThemeModeIcon extends StatelessWidget {
  final String assetName;
  final String title;
  final VoidCallback onTap;

  const _ThemeModeIcon.asset(
      {required this.assetName, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextStyle defaultTextStyle = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: AppColors.grey,
    );

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Ink(
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xff30393c).withOpacity(.5),
                  ),
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset(
                    assetName,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 21),
        Text(title, style: defaultTextStyle)
      ],
    );
  }
}
