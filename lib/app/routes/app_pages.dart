import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ousa/app/routes/app_routes.dart';
import 'package:ousa/features/auth/presentation/screens/login_screen.dart';
import 'package:ousa/features/auth/presentation/screens/register_screen.dart';
import 'package:ousa/features/home/presentation/screens/home_screen.dart';

class AppPages {
  AppPages._();

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
  ];
}