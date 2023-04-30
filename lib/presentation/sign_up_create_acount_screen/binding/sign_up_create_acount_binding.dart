import '../controller/sign_up_create_acount_controller.dart';
import 'package:get/get.dart';

class SignUpCreateAcountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpCreateAcountController());
  }
}
