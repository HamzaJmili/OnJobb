import '../controller/notifications_controller.dart';
import '../models/notifications_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_switch.dart';

// ignore: must_be_immutable
class NotificationsItemWidget extends StatelessWidget {
  NotificationsItemWidget(this.notificationsItemModelObj);

  NotificationsItemModel notificationsItemModelObj;

  var controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Text(
            notificationsItemModelObj.newpostTxt.value,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsRegular16.copyWith(
              letterSpacing: getHorizontalSize(
                0.12,
              ),
            ),
          ),
        ),
        Obx(
          () => CustomSwitch(
            value: notificationsItemModelObj.isSelectedSwitch.value,
            onChanged: (value) {
              notificationsItemModelObj.isSelectedSwitch.value = value;
            },
          ),
        ),
      ],
    );
  }
}
