import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/common/utils/utils.dart';
import 'package:music_player/common/widgets/basic_app_bar.dart';
import 'package:music_player/common/widgets/basic_app_button.dart';
import 'package:music_player/core/config/assets/app_assets.dart';
import 'package:music_player/data/models/auth/create_user_req.dart';
import 'package:music_player/domain/usecases/auth/signup_usecase.dart';
import 'package:music_player/presentation/auth/pages/signin.dart';
import 'package:music_player/presentation/home/pages/homepage.dart';
import 'package:music_player/service_locator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.isDarkMode;
    TextStyle? headingTextStyle = Theme.of(context).textTheme.displaySmall;

    Widget headingText = Text(
      textAlign: TextAlign.center,
      "Register",
      style: headingTextStyle?.copyWith(
        color: isDarkMode ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );

    void goToSigninPage() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SigninPage(),
        ),
      );
    }

    void goToRootPage() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
        (route) => false,
      );
    }

    void signUp() async {
      final result = await sl.get<SignupUseCase>().call(
            params: CreateUserRequest(
              fullname: _fullnameController.text,
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );

      result.fold(
        (l) {
          final snackBar = SnackBar(content: Text(l));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        (r) => goToRootPage(),
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
            TextField(
              controller: _fullnameController,
              decoration: const InputDecoration(
                hintText: "Fullname",
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 54),
            BasicAppButton(title: "Create Account", onPressed: signUp),
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
