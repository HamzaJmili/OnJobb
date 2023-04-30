import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/apply_job_screen/models/apply_job_model.dart';

class ApplyJobController extends GetxController {
  Rx<ApplyJobModel> applyJobModelObj = ApplyJobModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
