import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/privacy_screen/models/privacy_model.dart';

class PrivacyController extends GetxController {
  Rx<PrivacyModel> privacyModelObj = PrivacyModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
