import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/character_detail_screen.dart';
import 'package:rick_and_morty/features/episodes/data/models/episodes_model.dart';
import 'package:rick_and_morty/features/episodes/presentation/screens/episode_detail_screen.dart';
import 'package:rick_and_morty/features/locations/data/models/locations_model.dart';
import 'package:rick_and_morty/features/locations/presentation/screens/location_detail_screen.dart';
import 'package:rick_and_morty/features/authorization/presentation/screens/auth_screen.dart';
import 'package:rick_and_morty/internal/components/bottom_nav_bar.dart';
import 'package:rick_and_morty/features/authorization/presentation/screens/registration_screen.dart';
import 'package:rick_and_morty/features/settings/presentation/screens/detail_user_info_screen.dart';
import 'package:rick_and_morty/features/settings/presentation/screens/reset_password_screen.dart';
import 'package:rick_and_morty/features/settings/presentation/screens/settings_screen.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/splash_screen.dart';
import 'package:rick_and_morty/features/authorization/presentation/screens/verify_email_screen.dart';
import 'package:rick_and_morty/features/settings/presentation/screens/theme_manager.dart';
import 'package:rick_and_morty/internal/components/firebase_options.dart';
import 'package:rick_and_morty/internal/dependensies/get_it.dart';
import 'package:rick_and_morty/internal/services/firebase_streem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  final themeManager = ThemeManager();
  await themeManager.loadTheme();

  runApp(
    ChangeNotifierProvider.value(
      value: themeManager,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeManager>(context).currentTheme,
          routes: {
            '/': (context) => const FirebaseStream(),
            '/login': (context) => const AuthorizationScreen(),
            '/signup': (context) => const RegistrationScreen(),
            '/reset_password': (context) => const ResetPasswordScreen(),
            '/verify_email': (context) => const VerifyEmailScreen(),
            '/bottom_nav_bar': (context) => const BottomNavBarScreen(),
            '/splash': (context) => const SplashScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/characterDetail': (context) => CharacterDetailScreen(
                  charactersModel: ModalRoute.of(context)?.settings.arguments
                      as CharacterModel,
                ),
            '/location_detail': (context) => LocationDetailScreen(
                  locationModel: ModalRoute.of(context)?.settings.arguments
                      as LocationModel,
                ),
            '/episode_detail': (context) => EpisodeDetailScreen(
                  episodesModel: ModalRoute.of(context)?.settings.arguments
                      as EpisodesModel,
                ),
            '/detail_user': (context) => const DetailUserScreen(),
          },
          initialRoute: '/splash',
        );
      },
    );
  }
}
