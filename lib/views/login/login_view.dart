import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../core/constants/app_strings.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Obx(() => IconButton(
            icon: Icon(themeController.isDarkMode.value 
                ? Icons.light_mode 
                : Icons.dark_mode),
            onPressed: themeController.toggleTheme,
          )),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'app_icon',
                  child: Icon(
                    Icons.account_balance_wallet_rounded,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  AppStrings.loginTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.loginSubtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 48),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: AppStrings.loginUsernameLabel,
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  initialValue: AppStrings.loginDefaultUsername,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: AppStrings.loginPasswordLabel,
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  initialValue: AppStrings.loginDefaultPassword,
                ),
                const SizedBox(height: 32),
                Obx(() => ElevatedButton(
                  onPressed: authController.isAuthenticated.value 
                      ? null 
                      : () => authController.login(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: authController.isAuthenticated.value 
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text(AppStrings.loginButtonLabel),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
