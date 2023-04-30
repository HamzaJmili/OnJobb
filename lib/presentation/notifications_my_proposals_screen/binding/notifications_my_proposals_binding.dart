import '../controller/notifications_my_proposals_controller.dart';
import 'package:get/get.dart';

class NotificationsMyProposalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsMyProposalsController());
  }
}
