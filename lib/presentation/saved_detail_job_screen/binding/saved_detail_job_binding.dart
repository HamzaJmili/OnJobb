import '../controller/saved_detail_job_controller.dart';
import 'package:get/get.dart';

class SavedDetailJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SavedDetailJobController());
  }
}
