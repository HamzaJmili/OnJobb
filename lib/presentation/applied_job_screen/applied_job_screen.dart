import '../applied_job_screen/widgets/listclock2_item_widget.dart';
import '../applied_job_screen/widgets/listdescription2_item_widget.dart';
import 'controller/applied_job_controller.dart';
import 'models/listclock2_item_model.dart';
import 'models/listdescription2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';

class AppliedJobScreen extends GetWidget<AppliedJobController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 13, bottom: 13),
                    onTap: () {
                      onTapArrowleft8();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_job_details".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgBookmark,
                      margin:
                          getMargin(left: 16, top: 13, right: 16, bottom: 13))
                ]),
            body: Container(
                height: getVerticalSize(718),
                width: double.maxFinite,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: getMargin(right: 24),
                                padding: getPadding(
                                    left: 72, top: 24, right: 72, bottom: 24),
                                decoration: AppDecoration.outlineIndigo50
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder16),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: EdgeInsets.all(0),
                                          color: ColorConstant.gray100,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder39),
                                          child: Container(
                                              height: getSize(79),
                                              width: getSize(79),
                                              padding: getPadding(all: 19),
                                              decoration: AppDecoration
                                                  .fillGray100
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder39),
                                              child: Stack(children: [
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgFilter,
                                                    height: getSize(40),
                                                    width: getSize(40),
                                                    alignment: Alignment.center)
                                              ]))),
                                      Padding(
                                          padding: getPadding(top: 16),
                                          child: Text("msg_senior_ui_ux_de".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPlusJakartaSansBold14Bluegray900
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.07)))),
                                      Padding(
                                          padding: getPadding(top: 7),
                                          child: Text("lbl_shopee_sg".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPlusJakartaSansMedium12
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.06)))),
                                      Padding(
                                          padding: getPadding(left: 1, top: 12),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomButton(
                                                    height: getVerticalSize(28),
                                                    width:
                                                        getHorizontalSize(69),
                                                    text: "lbl_fulltime".tr,
                                                    variant: ButtonVariant
                                                        .FillGray100,
                                                    shape: ButtonShape
                                                        .RoundedBorder8,
                                                    fontStyle: ButtonFontStyle
                                                        .InterRegular12Bluegray400),
                                                CustomButton(
                                                    height: getVerticalSize(28),
                                                    width:
                                                        getHorizontalSize(104),
                                                    text: "lbl_two_days_ago".tr,
                                                    margin: getMargin(left: 9),
                                                    variant: ButtonVariant
                                                        .FillGray100,
                                                    shape: ButtonShape
                                                        .RoundedBorder8,
                                                    fontStyle: ButtonFontStyle
                                                        .InterRegular12Bluegray400)
                                              ]))
                                    ])),
                            Container(
                                height: getVerticalSize(124),
                                child: Obx(() => ListView.separated(
                                    padding: getPadding(
                                        left: 15, top: 24, right: 48),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          height: getVerticalSize(54));
                                    },
                                    itemCount: controller.appliedJobModelObj
                                        .value.listclock2ItemList.value.length,
                                    itemBuilder: (context, index) {
                                      Listclock2ItemModel model = controller
                                          .appliedJobModelObj
                                          .value
                                          .listclock2ItemList
                                          .value[index];
                                      return Listclock2ItemWidget(model);
                                    }))),
                            Container(
                                height: getVerticalSize(69),
                                child: Obx(() => ListView.separated(
                                    padding: getPadding(top: 25),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          height: getVerticalSize(12));
                                    },
                                    itemCount: controller
                                        .appliedJobModelObj
                                        .value
                                        .listdescription2ItemList
                                        .value
                                        .length,
                                    itemBuilder: (context, index) {
                                      Listdescription2ItemModel model =
                                          controller
                                              .appliedJobModelObj
                                              .value
                                              .listdescription2ItemList
                                              .value[index];
                                      return Listdescription2ItemWidget(model);
                                    }))),
                            Padding(
                                padding: getPadding(top: 20),
                                child: Text("lbl_job_description".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPlusJakartaSansBold16Bluegray900
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.08)))),
                            Container(
                                width: getHorizontalSize(319),
                                margin: getMargin(left: 7, top: 13, right: 24),
                                child: Text("msg_lorem_ipsum_dol4".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtPlusJakartaSansMedium14Gray600
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.07))))
                          ])),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: getPadding(
                              left: 24, top: 28, right: 24, bottom: 28),
                          decoration: AppDecoration.gradientGray50Gray5000,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomButton(
                                    height: getVerticalSize(56),
                                    text: "lbl_applied".tr,
                                    margin: getMargin(bottom: 12),
                                    variant: ButtonVariant.FillBluegray5001,
                                    padding: ButtonPadding.PaddingAll17,
                                    fontStyle: ButtonFontStyle
                                        .PlusJakartaSansSemiBold16Bluegray300_1)
                              ])))
                ]))));
  }

  onTapArrowleft8() {
    Get.back();
  }
}
