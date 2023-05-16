import 'package:onjobb/core/app_export.dart';

import '../models/publish_job_model.dart';

class PublishJobController extends GetxController {
  Rx<PublishJobModel> PublishJobModelObj = PublishJobModel().obs;

  Rx<String> selectedJobType = "on-site".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
