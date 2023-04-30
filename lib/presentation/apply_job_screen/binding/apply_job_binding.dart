import '../controller/apply_job_controller.dart';
import 'package:get/get.dart';

class ApplyJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplyJobController());
  }
}
