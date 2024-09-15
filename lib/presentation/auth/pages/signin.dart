import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/utils/utils.dart';
import 'package:music_player/common/widgets/basic_app_bar.dart';
import 'package:music_player/common/widgets/basic_app_button.dart';
import 'package:music_player/core/config/assets/app_assets.dart';
import 'package:music_player/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.isDarkMode;
    TextStyle? headingTextStyle = Theme.of(context).textTheme.displaySmall;

    Widget headingText = Text(
      textAlign: TextAlign.center,
      "Sign In",
      style: headingTextStyle?.copyWith(
        color: isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );

    void goToSignUpPage() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SignupPage(),
        ),
      );
    }

    return Scaffold(
      appBar: BasicAppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 35,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 64,
          horizontal: 24,
        ),
        child: Column(
          children: [
            headingText,
            const SizedBox(height: 44),
            const TextField(
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 18),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 54),
            BasicAppButton(title: "Sign in", onPressed: () {}),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member ?",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: goToSignUpPage,
                  child: const Text(
                    "Register now",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
