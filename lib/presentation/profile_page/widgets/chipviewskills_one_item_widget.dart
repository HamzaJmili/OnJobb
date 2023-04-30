import '../models/chipviewskills_one_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

// ignore: must_be_immutable
class ChipviewskillsOneItemWidget extends StatelessWidget {
  ChipviewskillsOneItemWidget(this.chipviewskillsOneItemModelObj);

  ChipviewskillsOneItemModel chipviewskillsOneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: getPadding(
          left: 16,
          right: 16,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewskillsOneItemModelObj.skillsOneTxt.value,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: ColorConstant.gray900,
            fontSize: getFontSize(
              12,
            ),
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
        selected: chipviewskillsOneItemModelObj.isSelected.value,
        backgroundColor: ColorConstant.whiteA700,
        selectedColor: Colors.transparent,
        shape: chipviewskillsOneItemModelObj.isSelected.value
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorConstant.blueGray5001,
                  width: getHorizontalSize(
                    1,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    22,
                  ),
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorConstant.blueGray50,
                  width: getHorizontalSize(
                    1,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    22,
                  ),
                ),
              ),
        onSelected: (value) {
          chipviewskillsOneItemModelObj.isSelected.value = value;
        },
      ),
    );
  }
}
