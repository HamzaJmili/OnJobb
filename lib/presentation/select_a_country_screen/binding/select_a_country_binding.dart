import '../controller/select_a_country_controller.dart';
import 'package:get/get.dart';

class SelectACountryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectACountryController());
  }
}
