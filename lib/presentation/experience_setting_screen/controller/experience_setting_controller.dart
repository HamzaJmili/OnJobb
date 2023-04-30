import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/experience_setting_screen/models/experience_setting_model.dart';

class ExperienceSettingController extends GetxController {
  Rx<ExperienceSettingModel> experienceSettingModelObj =
      ExperienceSettingModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
