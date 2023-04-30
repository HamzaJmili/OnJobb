import '../filter_bottomsheet/widgets/chipviewjobs_one_item_widget.dart';
import 'controller/filter_controller.dart';
import 'models/chipviewjobs_one_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class FilterBottomsheet extends StatelessWidget {
  FilterBottomsheet(this.controller);

  FilterController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            child: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 25, right: 24, bottom: 25),
                decoration: AppDecoration.fillWhiteA70002
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(right: 1),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgClose,
                                height: getSize(24),
                                width: getSize(24),
                                onTap: () {
                                  onTapImgClose();
                                }),
                            Padding(
                                padding: getPadding(left: 16),
                                child: Text("lbl_filter".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPlusJakartaSansSemiBold18
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.09)))),
                            Spacer(),
                            Padding(
                                padding: getPadding(top: 3, bottom: 2),
                                child: Text("lbl_reset_filters".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPlusJakartaSansSemiBold14DeeporangeA200
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.07))))
                          ])),
                      Padding(
                          padding: getPadding(left: 2, top: 29),
                          child: Text("lbl_categories".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansBold16.copyWith(
                                  letterSpacing: getHorizontalSize(0.08)))),
                      Padding(
                          padding: getPadding(left: 1, top: 14, right: 51),
                          child: Row(children: [
                            CustomButton(
                                height: getVerticalSize(44),
                                width: getHorizontalSize(159),
                                text: "msg_design_creati".tr,
                                variant: ButtonVariant.FillDeeporangeA200,
                                padding: ButtonPadding.PaddingT14,
                                fontStyle: ButtonFontStyle
                                    .PlusJakartaSansSemiBold12Gray50,
                                prefixWidget: Container(
                                    margin: getMargin(right: 5),
                                    child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgCheckmark18x18))),
                            CustomButton(
                                height: getVerticalSize(44),
                                width: getHorizontalSize(100),
                                text: "lbl_finance".tr,
                                margin: getMargin(left: 16),
                                variant: ButtonVariant.OutlineBluegray50,
                                padding: ButtonPadding.PaddingT14,
                                fontStyle: ButtonFontStyle
                                    .PlusJakartaSansSemiBold12Gray900_1,
                                prefixWidget: Container(
                                    margin: getMargin(right: 4),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgPlus)))
                          ])),
                      Padding(
                          padding: getPadding(left: 1, top: 10, right: 3),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                    height: getVerticalSize(44),
                                    width: getHorizontalSize(211),
                                    text: "msg_engineering_a".tr,
                                    variant: ButtonVariant.OutlineBluegray50,
                                    padding: ButtonPadding.PaddingT14,
                                    fontStyle: ButtonFontStyle
                                        .PlusJakartaSansSemiBold12Gray900_1,
                                    prefixWidget: Container(
                                        margin: getMargin(right: 4),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgPlus))),
                                CustomButton(
                                    height: getVerticalSize(44),
                                    width: getHorizontalSize(96),
                                    text: "lbl_writing".tr,
                                    variant: ButtonVariant.OutlineBluegray50,
                                    padding: ButtonPadding.PaddingT14,
                                    fontStyle: ButtonFontStyle
                                        .PlusJakartaSansSemiBold12Gray900_1,
                                    prefixWidget: Container(
                                        margin: getMargin(right: 4),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgPlus)))
                              ])),
                      Padding(
                          padding: getPadding(left: 1, top: 10, right: 38),
                          child: Row(children: [
                            CustomButton(
                                height: getVerticalSize(44),
                                width: getHorizontalSize(114),
                                text: "lbl_marketing".tr,
                                variant: ButtonVariant.OutlineBluegray50,
                                padding: ButtonPadding.PaddingT14,
                                fontStyle: ButtonFontStyle
                                    .PlusJakartaSansSemiBold12Gray900_1,
                                prefixWidget: Container(
                                    margin: getMargin(right: 5),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgPlus))),
                            CustomButton(
                                height: getVerticalSize(44),
                                width: getHorizontalSize(158),
                                text: "msg_development_i".tr,
                                margin: getMargin(left: 16),
                                variant: ButtonVariant.OutlineBluegray50,
                                padding: ButtonPadding.PaddingT14,
                                fontStyle: ButtonFontStyle
                                    .PlusJakartaSansSemiBold12Gray900_1,
                                prefixWidget: Container(
                                    margin: getMargin(right: 5),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgPlus)))
                          ])),
                      Padding(
                          padding: getPadding(top: 26),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_salaries".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPlusJakartaSansBold16
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.08))),
                                Padding(
                                    padding: getPadding(top: 2, bottom: 2),
                                    child: Text("lbl_6_000_month".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansSemiBold12DeeporangeA200
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.06))))
                              ])),
                      Padding(
                          padding: getPadding(top: 16),
                          child: SliderTheme(
                              data: SliderThemeData(
                                  trackShape: RoundedRectSliderTrackShape(),
                                  activeTrackColor:
                                      ColorConstant.deepOrangeA200,
                                  inactiveTrackColor:
                                      ColorConstant.blueGray5001,
                                  thumbColor: ColorConstant.whiteA700,
                                  thumbShape: RoundSliderThumbShape()),
                              child: Slider(
                                  value: 52.91,
                                  min: 0.0,
                                  max: 100.0,
                                  onChanged: (value) {}))),
                      Padding(
                          padding: getPadding(top: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_560".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPlusJakartaSansSemiBold12Bluegray400
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.06))),
                                Text("lbl_12_000".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPlusJakartaSansSemiBold12Bluegray400
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.06)))
                              ])),
                      Padding(
                          padding: getPadding(left: 2, top: 28),
                          child: Text("lbl_jobs".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansBold16.copyWith(
                                  letterSpacing: getHorizontalSize(0.08)))),
                      Padding(
                          padding: getPadding(left: 2, top: 16),
                          child: Obx(() => Wrap(
                              runSpacing: getVerticalSize(5),
                              spacing: getHorizontalSize(5),
                              children: List<Widget>.generate(
                                  controller
                                      .filterModelObj
                                      .value
                                      .chipviewjobsOneItemList
                                      .value
                                      .length, (index) {
                                ChipviewjobsOneItemModel model = controller
                                    .filterModelObj
                                    .value
                                    .chipviewjobsOneItemList
                                    .value[index];
                                return ChipviewjobsOneItemWidget(model);
                              })))),
                      CustomButton(
                          height: getVerticalSize(56),
                          text: "lbl_apply_filters".tr,
                          margin: getMargin(top: 30, bottom: 15),
                          padding: ButtonPadding.PaddingAll17,
                          fontStyle:
                              ButtonFontStyle.PlusJakartaSansSemiBold16Gray50)
                    ]))));
  }

  onTapImgClose() {
    Get.back();
  }
}
