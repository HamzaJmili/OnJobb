import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/saved_detail_job_screen/models/saved_detail_job_model.dart';

class SavedDetailJobController extends GetxController {
  Rx<SavedDetailJobModel> savedDetailJobModelObj = SavedDetailJobModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
