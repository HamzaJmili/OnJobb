import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/job_type_screen/models/job_type_model.dart';

class JobTypeController extends GetxController {
  Rx<JobTypeModel> jobTypeModelObj = JobTypeModel().obs;
  Rx<bool> isFreelancer = true.obs;

  void toggleIsFreelancer() {
    isFreelancer.toggle();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
