import '../controller/applied_job_controller.dart';
import '../models/listdescription2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

// ignore: must_be_immutable
class Listdescription2ItemWidget extends StatelessWidget {
  Listdescription2ItemWidget(this.listdescription2ItemModelObj);

  Listdescription2ItemModel listdescription2ItemModelObj;

  var controller = Get.find<AppliedJobController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        width: getHorizontalSize(
          101,
        ),
        margin: getMargin(
          right: 12,
        ),
        padding: getPadding(
          left: 16,
          top: 12,
          right: 16,
          bottom: 12,
        ),
        decoration: AppDecoration.txtFillGray100.copyWith(
          borderRadius: BorderRadiusStyle.txtCircleBorder22,
        ),
        child: Obx(
          () => Text(
            listdescription2ItemModelObj.descriptionTxt.value,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPlusJakartaSansSemiBold12Gray900.copyWith(
              letterSpacing: getHorizontalSize(
                0.06,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
