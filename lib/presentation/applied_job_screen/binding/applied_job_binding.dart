import '../controller/applied_job_controller.dart';
import 'package:get/get.dart';

class AppliedJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppliedJobController());
  }
}
