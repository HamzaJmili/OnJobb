import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/applied_job_screen/models/applied_job_model.dart';

class AppliedJobController extends GetxController {
  Rx<AppliedJobModel> appliedJobModelObj = AppliedJobModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
