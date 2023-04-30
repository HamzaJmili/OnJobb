import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/confirmation_dialog/models/confirmation_model.dart';

class ConfirmationController extends GetxController {
  Rx<ConfirmationModel> confirmationModelObj = ConfirmationModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
