import '../controller/enter_otp_controller.dart';
import 'package:get/get.dart';

class EnterOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterOtpController());
  }
}
