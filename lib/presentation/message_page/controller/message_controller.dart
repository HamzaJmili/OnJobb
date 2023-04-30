import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/message_page/models/message_model.dart';

class MessageController extends GetxController {
  MessageController(this.messageModelObj);

  Rx<MessageModel> messageModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
