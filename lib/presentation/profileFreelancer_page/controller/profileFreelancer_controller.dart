import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/profile_page/models/profile_model.dart';

import '../models/profileFreelancer_model.dart';

class ProfileFreelancerController extends GetxController {
  ProfileFreelancerController(this.profileFreelancerModelObj);

  Rx<ProfileFreelancerModel> profileFreelancerModelObj;

  Rx<String> radioGroup = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
