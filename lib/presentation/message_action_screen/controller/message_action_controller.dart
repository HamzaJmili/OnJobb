import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/message_action_screen/models/message_action_model.dart';
import 'package:onjobb/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class MessageActionController extends GetxController {
  TextEditingController frameOneController = TextEditingController();

  Rx<MessageActionModel> messageActionModelObj = MessageActionModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    frameOneController.dispose();
  }
}
