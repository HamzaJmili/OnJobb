import '../controller/onboarding_three_controller.dart';
import 'package:get/get.dart';

class OnboardingThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingThreeController());
  }
}
