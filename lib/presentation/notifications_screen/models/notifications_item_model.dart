import 'package:get/get.dart';

class NotificationsItemModel {
  Rx<String> newpostTxt = Rx("New Post");

  Rx<bool> isSelectedSwitch = Rx(false);

  Rx<String>? id = Rx("");
}
