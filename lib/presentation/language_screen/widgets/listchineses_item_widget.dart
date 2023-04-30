import '../controller/language_controller.dart';
import '../models/listchineses_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

// ignore: must_be_immutable
class ListchinesesItemWidget extends StatelessWidget {
  ListchinesesItemWidget(this.listchinesesItemModelObj);

  ListchinesesItemModel listchinesesItemModelObj;

  var controller = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        listchinesesItemModelObj.chinesesTxt.value,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: AppStyle.txtPlusJakartaSansSemiBold16Gray900.copyWith(
          letterSpacing: getHorizontalSize(
            0.08,
          ),
        ),
      ),
    );
  }
}
