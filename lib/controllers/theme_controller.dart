import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final SharedPreferences prefs;
  
  ThemeController({required this.prefs});

  final RxBool isDarkMode = false.obs;
  static const String themeKey = 'isDarkMode';

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = prefs.getBool(themeKey) ?? false;
    // Initial theme is set in main.dart using GetMaterialApp,
    // but we ensure it matches here.
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    prefs.setBool(themeKey, isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
