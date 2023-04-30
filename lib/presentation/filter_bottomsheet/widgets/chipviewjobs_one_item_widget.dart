import '../models/chipviewjobs_one_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';

// ignore: must_be_immutable
class ChipviewjobsOneItemWidget extends StatelessWidget {
  ChipviewjobsOneItemWidget(this.chipviewjobsOneItemModelObj);

  ChipviewjobsOneItemModel chipviewjobsOneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: getPadding(
          right: 16,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewjobsOneItemModelObj.jobsOneTxt.value,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: chipviewjobsOneItemModelObj.isSelected.value
                ? ColorConstant.gray900
                : ColorConstant.gray50,
            fontSize: getFontSize(
              12,
            ),
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
        avatar: CustomImageView(
          svgPath: ImageConstant.imgCheckmark18x18,
          height: getSize(
            18,
          ),
          width: getSize(
            18,
          ),
          margin: getMargin(
            right: 4,
          ),
        ),
        selected: chipviewjobsOneItemModelObj.isSelected.value,
        backgroundColor: ColorConstant.deepOrangeA200,
        selectedColor: ColorConstant.whiteA700,
        shape: chipviewjobsOneItemModelObj.isSelected.value
            ? RoundedRectangleBorder(
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
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    22,
                  ),
                ),
              ),
        onSelected: (value) {
          chipviewjobsOneItemModelObj.isSelected.value = value;
        },
      ),
    );
  }
}
