import 'package:flutter/material.dart';
import 'package:music_player/common/widgets/basic_app_button.dart';
import 'package:music_player/core/config/assets/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/core/config/theme/app_colors.dart';
import 'package:music_player/presentation/choose_mode/pages/choose_mode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    void goToChooseModePage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const ChooseModePage();
          },
        ),
      );
    }

    TextStyle textStyleMedium = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    TextStyle textStyleSmall = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.grey,
    );

    Widget backgroundImage = Container(
      padding: const EdgeInsets.all(40),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.introBg),
            opacity: .7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppVectors.logo),
          const Spacer(),
          Text(
            "Enjoy Listening To Music",
            style: textStyleMedium,
          ),
          const SizedBox(height: 21),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: textStyleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 21),
          BasicAppButton(
            title: "Get Started",
            onPressed: goToChooseModePage,
          )
        ],
      ),
    );

    return Scaffold(body: backgroundImage);
  }
}
