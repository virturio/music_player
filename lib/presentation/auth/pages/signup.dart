import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/common/utils/utils.dart';
import 'package:music_player/common/widgets/basic_app_bar.dart';
import 'package:music_player/common/widgets/basic_app_button.dart';
import 'package:music_player/core/config/assets/app_assets.dart';
import 'package:music_player/presentation/auth/pages/signin.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.isDarkMode;

    void goToSigninPage() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SigninPage(),
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
            const AuthHeaderText(
              title: "Register",
            ),
            const SizedBox(height: 44),
            const BasicAppTextField(
              hintText: "Fullname",
            ),
            const SizedBox(height: 18),
            const BasicAppTextField(
              hintText: "Email",
            ),
            const SizedBox(height: 18),
            const BasicAppTextField(
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 54),
            BasicAppButton(title: "Create Account", onPressed: () {}),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do you have an account?",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: goToSigninPage,
                  child: const Text(
                    "Sign in",
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

class BasicAppTextField extends StatelessWidget {
  const BasicAppTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
  });

  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

class AuthHeaderText extends StatelessWidget {
  const AuthHeaderText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.displaySmall;
    bool isDarkMode = context.isDarkMode;

    return Text(
      textAlign: TextAlign.center,
      title,
      style: style?.copyWith(
        color: isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
