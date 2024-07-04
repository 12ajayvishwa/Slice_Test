import 'package:slice/presentation/auth/login_screen.dart';
import 'package:slice/presentation/auth/signup_screen.dart';
import 'package:slice/presentation/auth/verification_screen.dart';
import 'package:slice/presentation/home_screen.dart';

import '../presentation/dashboard.dart';
import '../presentation/splash/splash_screen.dart';
import '../core/constants/app_export.dart';

class AppRoutes {
  static const SPLASHSCREEN = '/';
  static const ONBOARDSCREEN = '/onboard';
  static const LOGIN = '/login';
  static const LOGIN_VERIFICATION = '/login_verification';
  static const SIGN_UP = '/sign_up';
  static const DASHBOARD = '/dashboard';

  static List<GetPage> pages = [
    GetPage(
      name: SPLASHSCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: SIGN_UP,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: LOGIN,
      page: () => const LoginScreen(),
    ),
    // GetPage(name: SPLASHSCREEN, page: () => const SplashScreen()),
    GetPage(
        name: LOGIN_VERIFICATION, page: () => const OtpVerificationScreen()),
    GetPage(name: DASHBOARD, page: () => const Dashboard()),
  ];
}
