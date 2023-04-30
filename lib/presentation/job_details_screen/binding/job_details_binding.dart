import '../controller/job_details_controller.dart';
import 'package:get/get.dart';

class JobDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobDetailsController());
  }
}
