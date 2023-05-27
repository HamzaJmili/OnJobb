import '../../models/Education.dart';
import '../../models/Experience.dart';
import '../profile_page/widgets/chipviewskills_one_item_widget.dart';
import '../profile_page/widgets/profile_item_widget.dart';
import 'controller/profile_controller.dart';
import 'models/chipviewskills_one_item_model.dart';
import 'models/profile_item_model.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_radio_button.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.userisFreelancer.value == true) {
        // show profile page of freelancer
        return SafeArea(child: Obx(() {
           if (controller.freelancer.value == null) {
          
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(37),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24),
                    onTap: () {
                      onTapArrowleft11();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_profile".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgSettings,
                      margin: getMargin(left: 24, right: 24),
                      onTap: () {
                        onTapSettings2();
                      })
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(top: 43, bottom: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: getVerticalSize(225),
                                  width: getHorizontalSize(327),
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgBg120x327,
                                            height: getVerticalSize(120),
                                            width: getHorizontalSize(327),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(8)),
                                            alignment: Alignment.topCenter),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 88, right: 87),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CircleAvatar(
  backgroundImage: controller.freelancer.value?.photoUrl != null
      ? NetworkImage(controller.freelancer.value!.photoUrl)
      : null,
  backgroundColor: controller.freelancer.value?.photoUrl != null
      ? null
      : Colors.grey, // Set a specific background color for the avatar
  radius: 30,
  child: controller.freelancer.value?.photoUrl != null
      ? null
      : const Icon(
          Icons.person, // Replace with your desired default icon
          size: 30,
          color: Colors.white,
        ),
),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 9),
                                                          child: Text(
                                                              "${controller.freelancer.value?.firstname} ${controller.freelancer.value?.lastname}"
                                                                  ,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPlusJakartaSansBold18Gray90001
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.09)))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Obx(() =>
                                                              CustomRadioButton(
                                                                  text:
                                                                      "lbl_open_to_work"
                                                                          .tr,
                                                                  value:
                                                                      "lbl_open_to_work"
                                                                          .tr,
                                                                  groupValue:
                                                                      controller
                                                                          .radioGroup
                                                                          .value,
                                                                  margin:
                                                                      getMargin(
                                                                          top:
                                                                              5),
                                                                  fontStyle:
                                                                      RadioFontStyle
                                                                          .PoppinsMedium14,
                                                                  onChange:
                                                                      (value) {
                                                                    controller
                                                                        .radioGroup
                                                                        .value = value;
                                                                  })))
                                                    ])))
                                      ])),
                              Container(
                                  width: getHorizontalSize(272),
                                  margin:
                                      getMargin(left: 52, top: 15, right: 50),
                                  child: Text(" ${controller.freelancer.value?.speciallization.join(", ")}",
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtInterRegular14
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.07)))),
                              Padding(
                                  padding:
                                      getPadding(left: 24, top: 17, right: 24),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: getHorizontalSize(154),
                                            padding: getPadding(
                                                left: 40,
                                                top: 12,
                                                right: 40,
                                                bottom: 12),
                                            decoration: AppDecoration
                                                .fillGray20001
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 2),
                                                      child: Text("lbl_25".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansBold16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08)))),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top: 5,
                                                          bottom: 1),
                                                      child: Text(
                                                          "lbl_applied".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansMedium12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.06))))
                                                ])),
                                        Container(
                                            width: getHorizontalSize(154),
                                            margin: getMargin(left: 19),
                                            padding: getPadding(
                                                left: 35,
                                                top: 12,
                                                right: 35,
                                                bottom: 12),
                                            decoration: AppDecoration
                                                .fillGray20001
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 2),
                                                      child: Text("lbl_10".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansBold16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08)))),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top: 4,
                                                          bottom: 3),
                                                      child: Text(
                                                          "lbl_reviewed".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansMedium12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.06))))
                                                ]))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 24),
                                  child: Divider(
                                      height: getVerticalSize(2),
                                      thickness: getVerticalSize(2),
                                      color: ColorConstant.indigo50)),
                          
                              Container(
                            width: double.maxFinite,
                            margin :getMargin(top : 20, right : 10 , left : 10),
                            child: Container(
                                padding: getPadding(all: 16),
                                decoration: AppDecoration.outlineIndigo50
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder12),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: getPadding(top: 1),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: getPadding(top: 2),
                                                    child: Text(
                                                        "lbl_experience".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPlusJakartaSansBold18
                                                            .copyWith(
                                                                letterSpacing:
                                                                    getHorizontalSize(
                                                                        0.09)))),
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgShare,
                                                    height: getSize(24),
                                                    width: getSize(24),
                                                    margin:
                                                        getMargin(bottom: 1),
                                                    onTap: () {
                                                      onTapImgShare();
                                                    })
                                              ])),
                                      Padding(
                                          padding:
                                              getPadding(top: 15, right: 60),
                                          child: Obx(() => ListView.separated(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (context, index) {
                                                return Padding(
                                                    padding: getPadding(
                                                        top: 19.5,
                                                        bottom: 19.5),
                                                    child: SizedBox(
                                                        width:
                                                            getHorizontalSize(
                                                                295),
                                                        child: Divider(
                                                            height:
                                                                getVerticalSize(
                                                                    1),
                                                            thickness:
                                                                getVerticalSize(
                                                                    1),
                                                            color: ColorConstant
                                                                .indigo50)));
                                              },
                                              itemCount: controller
                                                  .experiencesList.length,
                                              itemBuilder: (context, index) {
                                                Experience experience =
                                                    controller
                                                        .experiencesList[index];
                                                return ProfileItemWidget(
                                                    experience.toMap(), false);
                                              })))
                                    ]))),
                              Container(
                            width: double.maxFinite,
                             margin :getMargin( right : 10 , left : 10),
                            child: Container(
                                padding: getPadding(all: 16),
                                margin: getMargin(top: 30),
                                decoration: AppDecoration.outlineIndigo50
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder12),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: getPadding(top: 1),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                    padding: getPadding(top: 2),
                                                    child: Text(
                                                        "lbl_education".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPlusJakartaSansBold18
                                                            .copyWith(
                                                                letterSpacing:
                                                                    getHorizontalSize(
                                                                        0.09)))),
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgShare,
                                                    height: getSize(24),
                                                    width: getSize(24),
                                                    margin:
                                                        getMargin(bottom: 1),
                                                    onTap: () {
                                                      onTapImgShare();
                                                    })
                                              ])),
                                      Padding(
                                          padding:
                                              getPadding(top: 15, right: 60),
                                          child: Obx(() => ListView.separated(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (context, index) {
                                                return Padding(
                                                    padding: getPadding(
                                                        top: 19.5,
                                                        bottom: 19.5),
                                                    child: SizedBox(
                                                        width:
                                                            getHorizontalSize(
                                                                295),
                                                        child: Divider(
                                                            height:
                                                                getVerticalSize(
                                                                    1),
                                                            thickness:
                                                                getVerticalSize(
                                                                    1),
                                                            color: ColorConstant
                                                                .indigo50)));
                                              },
                                              itemCount: controller
                                                  .educationsList.length,
                                              itemBuilder: (context, index) {
                                                Education education = controller
                                                    .educationsList[index];
                                                
                                                return ProfileItemWidget(
                                                    education.toMap(), true);
                                              })))
                                    ])))
                            ])))));
        }
        }));
       
      } 
      
      
      else {
       
        // show profile page of client


      return SafeArea(child: Obx(() {
           if (controller.client.value == null) {
          print(
              "print inside the firstif in profile page means freelancer.value==null ");
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(37),
                leadingWidth: 48,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24),
                    onTap: () {
                      onTapArrowleft11();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_profile".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgSettings,
                      margin: getMargin(left: 24, right: 24),
                      onTap: () {
                        onTapSettings2();
                      })
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(top: 43, bottom: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: getVerticalSize(225),
                                  width: getHorizontalSize(327),
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgBg120x327,
                                            height: getVerticalSize(120),
                                            width: getHorizontalSize(327),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(8)),
                                            alignment: Alignment.topCenter),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 88, right: 87),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                    CircleAvatar(
  backgroundImage: controller.client.value?.photoUrl != null
      ? NetworkImage(controller.client.value!.photoUrl)
      : null,
  backgroundColor: controller.client.value?.photoUrl != null
      ? null
      : Colors.grey, // Set a specific background color for the avatar
  radius: 30,
  child: controller.client.value?.photoUrl != null
      ? null
      : const Icon(
          Icons.person, // Replace with your desired default icon
          size: 30,
          color: Colors.white,
        ),
),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 9),
                                                          child: Text(
                                                              "${controller.client.value?.firstname} ${controller.client.value?.lastname} "
                                                                  ,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPlusJakartaSansBold18Gray90001
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.09)))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Obx(() =>
                                                              CustomRadioButton(
                                                                  text:
                                                                      "lbl_open_to_work"
                                                                          .tr,
                                                                  value:
                                                                      "lbl_open_to_work"
                                                                          .tr,
                                                                  groupValue:
                                                                      controller
                                                                          .radioGroup
                                                                          .value,
                                                                  margin:
                                                                      getMargin(
                                                                          top:
                                                                              5),
                                                                  fontStyle:
                                                                      RadioFontStyle
                                                                          .PoppinsMedium14,
                                                                  onChange:
                                                                      (value) {
                                                                    controller
                                                                        .radioGroup
                                                                        .value = value;
                                                                  })))
                                                    ])))
                                      ])),
                              Container(
                                  width: getHorizontalSize(272),
                                  margin:
                                      getMargin(left: 52, top: 15, right: 50),
                                  child: Text("msg_ui_ux_designer".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtInterRegular14
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.07)))),
                              Padding(
                                  padding:
                                      getPadding(left: 24, top: 17, right: 24),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: getHorizontalSize(154),
                                            padding: getPadding(
                                                left: 40,
                                                top: 12,
                                                right: 40,
                                                bottom: 12),
                                            decoration: AppDecoration
                                                .fillGray20001
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 2),
                                                      child: Text("lbl_25".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansBold16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08)))),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top: 5,
                                                          bottom: 1),
                                                      child: Text(
                                                          "lbl_applied".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansMedium12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.06))))
                                                ])),
                                        Container(
                                            width: getHorizontalSize(154),
                                            margin: getMargin(left: 19),
                                            padding: getPadding(
                                                left: 35,
                                                top: 12,
                                                right: 35,
                                                bottom: 12),
                                            decoration: AppDecoration
                                                .fillGray20001
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 2),
                                                      child: Text("lbl_10".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansBold16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08)))),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top: 4,
                                                          bottom: 3),
                                                      child: Text(
                                                          "lbl_reviewed".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansMedium12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.06))))
                                                ]))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 24),
                                  child: Divider(
                                      height: getVerticalSize(2),
                                      thickness: getVerticalSize(2),
                                      color: ColorConstant.indigo50)),
                              Container(
                                  margin:
                                      getMargin(left: 24, top: 22, right: 24),
                                  padding: getPadding(
                                      left: 16, top: 14, right: 16, bottom: 14),
                                  decoration: AppDecoration.outlineIndigo50
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder12),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 1),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          top: 2, bottom: 1),
                                                      child: Text(
                                                          "lbl_about_me".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtInterSemiBold16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08)))),
                                                  CustomImageView(
                                                      svgPath:
                                                          ImageConstant.imgEdit,
                                                      height: getSize(24),
                                                      width: getSize(24))
                                                ])),
                                        Container(
                                            width: getHorizontalSize(272),
                                            margin:
                                                getMargin(top: 14, right: 22),
                                            child: Text(
                                                "${controller.client.value?.bio}",
                                                maxLines: null,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPlusJakartaSansMedium14Bluegray400
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.07))))
                                      ])),
                         
                              
                            ])))));
        }
        }));
      }
    });
  }

  onTapArrowleft11() {
    Get.back();
  }

  onTapSettings2() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
   onTapImgShare() {
    Get.toNamed(
      AppRoutes.newPositionScreen,
    );
  }

  onTapAddnewposition() {
    Get.toNamed(
      AppRoutes.newPositionScreen,
    );
  }

  onTapAddneweducation() {
    Get.toNamed(
      AppRoutes.addNewEducationScreen,
    );
  }
}
