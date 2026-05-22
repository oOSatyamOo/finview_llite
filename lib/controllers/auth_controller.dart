import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final SharedPreferences prefs;

  AuthController({required this.prefs});

  final RxBool isAuthenticated = false.obs;
  static const String authKey = 'isAuthenticated';

  @override
  void onInit() {
    super.onInit();
    isAuthenticated.value = prefs.getBool(authKey) ?? false;
  }

  Future<void> login() async {
    // Mock login delay
    await Future.delayed(const Duration(seconds: 1));
    isAuthenticated.value = true;
    await prefs.setBool(authKey, true);
    Get.offAllNamed('/home');
  }

  Future<void> logout() async {
    isAuthenticated.value = false;
    await prefs.setBool(authKey, false);
    Get.offAllNamed('/login');
  }
}
