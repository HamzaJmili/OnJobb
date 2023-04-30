import '../controller/message_action_controller.dart';
import 'package:get/get.dart';

class MessageActionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageActionController());
  }
}
