import '../controller/notifications_general_controller.dart';
import 'package:get/get.dart';

class NotificationsGeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsGeneralController());
  }
}
