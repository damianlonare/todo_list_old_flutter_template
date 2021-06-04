import 'package:clean_onboarding/screens/home/home_screen.dart';
import 'package:clean_onboarding/screens/login/login_screen.dart';
import 'package:clean_onboarding/screens/signup/signup_screen.dart';
import 'package:clean_onboarding/screens/splash/splash.dart';

final pages = {
  'login': LoginScreen(),
  'home': HomeScreen(),
  'splash': SplashScreen(),
  '' : LoginScreen(),
};

final routes = {
  // When navigating to the "/signup" route, build the SignUpScreen BLOC.
  '/signup': (context) => SignUpScreen(),
  // When navigating to the "/profile" route, build the ProfileScreen BLOC.
  // '/profile': (context) => ProfileScreen(),
  // '/recover-password': (context) => RecoverPasswordScreen(),
};
