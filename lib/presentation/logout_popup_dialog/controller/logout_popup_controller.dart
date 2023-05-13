import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/logout_popup_dialog/models/logout_popup_model.dart';

class LogoutPopupController extends GetxController {
  Rx<LogoutPopupModel> logoutPopupModelObj = LogoutPopupModel().obs;

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
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
