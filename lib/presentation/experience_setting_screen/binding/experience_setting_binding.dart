import '../controller/experience_setting_controller.dart';
import 'package:get/get.dart';

class ExperienceSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExperienceSettingController());
  }
}
