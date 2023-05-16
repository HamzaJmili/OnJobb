import '../controller/publish_job_controller.dart';
import 'package:get/get.dart';

class PublishJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PublishJobController());
  }
}
