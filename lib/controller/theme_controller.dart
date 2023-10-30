import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends FullLifeCycleController with FullLifeCycleMixin {
  final SharedPreferences pref;
  ThemeController(this.pref);
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    var isDarkModeData = isDarkMode();
    if (isDarkModeData == null) {
      updateMode(Get.isPlatformDarkMode ? ThemeMode.dark : ThemeMode.light);
    } else {
      updateMode(isDarkModeData ? ThemeMode.dark : ThemeMode.light);
    }
  }

  void updateMode(ThemeMode mode, {bool isSaveLocalThemeData = false}) {
    themeMode(mode);
    if (isSaveLocalThemeData) {
      saveLocalData();
    }
  }

  void saveLocalData() {
    pref.setBool('isDarkMode', themeMode.value == ThemeMode.dark);
  }

  bool? isDarkMode() {
    return pref.getBool('isDarkMode');
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    init();
  }
}
