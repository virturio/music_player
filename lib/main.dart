import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:music_player/core/config/theme/app_theme.dart';
import 'package:music_player/firebase_options.dart';
import 'package:music_player/presentation/choose_mode/bloc/theme_qubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:music_player/presentation/splash/pages/splash.dart';
import 'package:music_player/service_locator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeQubit>(create: (_) => ThemeQubit()),
      ],
      child: BlocBuilder<ThemeQubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            home: const Scaffold(
              body: SplashPage(),
            ),
          );
        },
      ),
    );
  }
}
