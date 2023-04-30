import 'controller/new_position_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';
import 'package:onjobb/widgets/custom_text_form_field.dart';

class NewPositionScreen extends GetWidget<NewPositionController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(24),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24),
                    onTap: () {
                      onTapArrowleft15();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "msg_add_new_positio".tr)),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 24, top: 49, right: 24, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("lbl_title".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle
                                      .txtPlusJakartaSansMedium14Bluegray900
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07))),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.frameOneController,
                                  hintText: "lbl_ex_ui_designer".tr,
                                  margin: getMargin(top: 9)),
                              Container(
                                  width: double.maxFinite,
                                  child: Container(
                                      margin: getMargin(top: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("lbl_employment_type".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPlusJakartaSansMedium14Bluegray900
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.07))),
                                            Container(
                                                margin: getMargin(top: 7),
                                                padding: getPadding(
                                                    left: 16,
                                                    top: 13,
                                                    right: 16,
                                                    bottom: 13),
                                                decoration: AppDecoration
                                                    .outlineIndigo50
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder24),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 2),
                                                          child: Text(
                                                              "lbl_please_select"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPlusJakartaSansMedium16
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.08)))),
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgArrowdownGray90002,
                                                          height: getSize(24),
                                                          width: getSize(24),
                                                          margin: getMargin(
                                                              right: 3))
                                                    ]))
                                          ]))),
                              Padding(
                                  padding: getPadding(top: 20),
                                  child: Text("lbl_company_name".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtPlusJakartaSansMedium14Bluegray900
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.07)))),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.frameOneOneController,
                                  hintText: "lbl_ex_shopee".tr,
                                  margin: getMargin(top: 7)),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("lbl_location2".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtPlusJakartaSansMedium14Bluegray900
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.07)))),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.countryController,
                                  hintText: "msg_ex_singapore".tr,
                                  margin: getMargin(top: 9)),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("lbl_start_date".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtPlusJakartaSansMedium14Bluegray900
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.07)))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowsmalllabelregulthree();
                                  },
                                  child: Container(
                                      margin: getMargin(top: 9),
                                      padding: getPadding(
                                          left: 16,
                                          top: 14,
                                          right: 16,
                                          bottom: 14),
                                      decoration: AppDecoration.outlineIndigo50
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder24),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 2),
                                                child: Obx(() => Text(
                                                    controller
                                                        .newPositionModelObj
                                                        .value
                                                        .smalllabelregulThreeTxt
                                                        .value,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPlusJakartaSansMedium16
                                                        .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.08))))),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCalendar,
                                                height: getSize(24),
                                                width: getSize(24))
                                          ]))),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("lbl_end_date".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtPlusJakartaSansMedium14Bluegray900
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.07)))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowsmalllabelregulfour();
                                  },
                                  child: Container(
                                      margin: getMargin(top: 9),
                                      padding: getPadding(
                                          left: 16,
                                          top: 14,
                                          right: 16,
                                          bottom: 14),
                                      decoration: AppDecoration.outlineIndigo50
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder24),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding: getPadding(top: 2),
                                                child: Obx(() => Text(
                                                    controller
                                                        .newPositionModelObj
                                                        .value
                                                        .smalllabelregulFourTxt
                                                        .value,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPlusJakartaSansMedium16
                                                        .copyWith(
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.08))))),
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgCalendar,
                                                height: getSize(24),
                                                width: getSize(24))
                                          ]))),
                              Padding(
                                  padding: getPadding(top: 20),
                                  child: Text("msg_job_role_descri".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtPlusJakartaSansMedium14Bluegray900
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.07)))),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.frameOneTwoController,
                                  hintText: "lbl_lorem_ipsun".tr,
                                  margin: getMargin(top: 7),
                                  padding: TextFormFieldPadding.PaddingT55,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 6)
                            ])))),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(56),
                text: "lbl_save_changes".tr,
                margin: getMargin(left: 24, right: 24, bottom: 37),
                padding: ButtonPadding.PaddingAll17,
                fontStyle: ButtonFontStyle.PlusJakartaSansSemiBold16Gray50,
                onTap: () {
                  onTapSavechanges();
                })));
  }

  Future<void> onTapRowsmalllabelregulthree() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller
            .newPositionModelObj.value.selectedSmalllabelregulThreeTxt!.value,
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (dateTime != null) {
      controller.newPositionModelObj.value.selectedSmalllabelregulThreeTxt!
          .value = dateTime;
      controller.newPositionModelObj.value.smalllabelregulThreeTxt.value =
          dateTime.format(DD_MM_YYYY);
    }
  }

  Future<void> onTapRowsmalllabelregulfour() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller
            .newPositionModelObj.value.selectedSmalllabelregulFourTxt!.value,
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (dateTime != null) {
      controller.newPositionModelObj.value.selectedSmalllabelregulFourTxt!
          .value = dateTime;
      controller.newPositionModelObj.value.smalllabelregulFourTxt.value =
          dateTime.format(DD_MM_YYYY);
    }
  }

  onTapSavechanges() {
    Get.toNamed(
      AppRoutes.experienceSettingScreen,
    );
  }

  onTapArrowleft15() {
    Get.back();
  }
}
