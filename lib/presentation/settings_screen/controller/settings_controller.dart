import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/settings_screen/models/settings_model.dart';
import 'package:flutter/material.dart';

class SettingsController extends GetxController {
  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  Rx<bool> isCheckbox = false.obs;
  var selectedLanguage = 'french'.obs;

  void updateLanguage(String language) {
    selectedLanguage.value = language;

    // Update the locale based on the selected language
    if (selectedLanguage.value == 'french') {
      Get.updateLocale(const Locale('fr', 'FR'));
    } else if (selectedLanguage.value == 'english') {
      Get.updateLocale(const Locale('en', 'US'));
    }
  }
  
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
