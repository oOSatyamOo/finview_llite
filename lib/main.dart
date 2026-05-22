import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/app_theme.dart';
import 'controllers/auth_controller.dart';
import 'controllers/theme_controller.dart';
import 'views/home/home_page.dart';
import 'views/login/login_view.dart';
import 'views/dashboard/dashboard_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Dependency Injection using GetX
  final prefs = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(prefs, permanent: true);
  Get.put<AuthController>(AuthController(prefs: prefs), permanent: true);
  Get.put<ThemeController>(ThemeController(prefs: prefs), permanent: true);

  runApp(const FinViewLiteApp());
}

class FinViewLiteApp extends StatelessWidget {
  const FinViewLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    
    return Obx(() => GetMaterialApp(
      title: 'FinView Lite',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: Get.find<AuthController>().isAuthenticated.value ? '/home' : '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginView(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(
            child: DashboardView(),
          ),
          transition: Transition.noTransition, // HomePage handles its own slide animation
        ),
      ],
    ));
  }
}
