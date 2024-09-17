import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/utils/utils.dart';
import 'package:music_player/common/widgets/basic_app_bar.dart';
import 'package:music_player/common/widgets/basic_app_button.dart';
import 'package:music_player/core/config/assets/app_assets.dart';
import 'package:music_player/data/models/auth/signin_user_req.dart';
import 'package:music_player/domain/usecases/auth/signin_usecase.dart';
import 'package:music_player/presentation/auth/pages/signup.dart';
import 'package:music_player/presentation/home/pages/homepage.dart';
import 'package:music_player/service_locator.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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

    void goToRootPage() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
        (route) => false,
      );
    }

    void signIn() async {
      final result = await sl.get<SigninUseCase>().call(
            params: SigninUserRequest(
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
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 54),
            BasicAppButton(title: "Sign in", onPressed: signIn),
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
