import '../controller/sign_up_complete_account_controller.dart';
import 'package:get/get.dart';

class SignUpCompleteAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpCompleteAccountController());
  }
}
