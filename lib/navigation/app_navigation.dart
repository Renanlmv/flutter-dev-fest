import 'package:devfest/model/talk.dart';
import 'package:devfest/navigation/app_routes.dart';
import 'package:devfest/ui/screens/about_screen.dart';
import 'package:devfest/ui/screens/home_screen.dart';
import 'package:devfest/ui/screens/login_screen.dart';
import 'package:devfest/ui/screens/signin_screen.dart';
import 'package:devfest/ui/screens/splash_screen.dart';
import 'package:devfest/ui/screens/talk_detail_screen.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(
            onNavigateToLogin: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
          ),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(
            onLoginClick: (email) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (routes) => false, // remove todas as rotas
                arguments: email,
              );
            },
            onSignInClick: (email) {
              Navigator.pushNamed(context, AppRoutes.sigIn, arguments: email);
            },
          ),
        );

      case AppRoutes.sigIn:
        final email = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (context) => SignInScreen(
            email: email,
            onCreateAccountClick: (email) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.home,
                (routes) => false,
                arguments: email,
              );
            },
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.home:
        final String email = settings.arguments as String? ?? '';
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            email: email,
            onAboutClick: () {
              Navigator.pushNamed(context, AppRoutes.about);
            },
            onSpeakerClick: (talk) {
              Navigator.pushNamed(context, AppRoutes.detail, arguments: talk);
            },
            onLogoutClick: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (routes) => false,
              );
            },
          ),
        );

      case AppRoutes.detail:
        final talk = settings.arguments as Talk?;
        return MaterialPageRoute(
          builder: (context) => TalkDetailScreen(
            talk: talk,
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      case AppRoutes.about:
        return MaterialPageRoute(
          builder: (context) => AboutScreen(
            onBackClick: () {
              Navigator.pop(context);
            },
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text("Página não encontrada"))),
        );
    }
  }
}
