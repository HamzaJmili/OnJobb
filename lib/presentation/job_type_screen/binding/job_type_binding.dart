import '../controller/job_type_controller.dart';
import 'package:get/get.dart';

class JobTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobTypeController());
  }
}
