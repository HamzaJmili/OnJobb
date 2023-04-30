import '../controller/add_new_education_controller.dart';
import 'package:get/get.dart';

class AddNewEducationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewEducationController());
  }
}
