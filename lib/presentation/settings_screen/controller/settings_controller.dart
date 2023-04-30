import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/settings_screen/models/settings_model.dart';
import 'package:onjobb/widgets/custom_bottom_bar.dart';

class SettingsController extends GetxController {
  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  Rx<bool> isCheckbox = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
