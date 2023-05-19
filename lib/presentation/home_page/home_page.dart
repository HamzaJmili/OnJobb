import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/Client.dart';
import '../../models/Freelancer.dart';
import '../../models/Job.dart';
import '../../widgets/custom_button.dart';
import '../home_page/widgets/listgroup_item_widget.dart';
import '../home_page/widgets/listuser_item_widget.dart';
import '../publish_job_screen/publish_job_screen.dart';
import 'controller/home_controller.dart';
import 'freelancer_widget.dart';
import 'job_widget.dart';
import 'models/home_model.dart';
import 'models/listgroup_item_model.dart';
import 'models/listuser_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController(HomeModel().obs));

  final FirebaseAuth auth = FirebaseAuth.instance;
  Freelancer? freelancer;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.getCurrentUser();
    controller.getJobsAndClient();
    print("the lengh of freelancerlist is : ${controller.freelancersList.length}");
    return Obx(() {
      if (controller.userisFreelancer.value == true) {
        // Show the freelancer home page if the user is a freelancer
        return SafeArea(
            key: _formKey,
            child: Obx(() {
              if (controller.freelancer.value == null) {
                print(
                    "the client vlaue is null and here is : ${controller.freelancer.value?.email}");
                return const Center(child: CircularProgressIndicator());
              } else {
                freelancer = controller.freelancer.value;
                return Scaffold(
                    backgroundColor: ColorConstant.whiteA70002,
                    appBar: CustomAppBar(
                        height: getVerticalSize(50),
                        leadingWidth: 74,
                        leading: Obx(() => CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                controller.freelancer.value?.photoUrl ?? "",
                              ),
                              radius: 25,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      controller.freelancer.value?.photoUrl ??
                                          "",
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.person),
                                ),
                              ),
                            )),
                        title: Padding(
                            padding: getPadding(left: 10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Hi welcome back FREELANCER ${controller.freelancer.value?.firstname}", // the recent value of text "msg_hi_welcome_bac ".tr
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPlusJakartaSansBold14
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.07)))),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding:
                                              getPadding(top: 9, right: 33),
                                          child: Text(
                                              "${controller.freelancer.value?.bio}", //   the recent value of text "msg_find_your_dream".tr
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPlusJakartaSansMedium12
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              0.06)))))
                                ])),
                        actions: [
                          AppbarImage(
                              height: getSize(24),
                              width: getSize(24),
                              svgPath: ImageConstant.imgLightbulb,
                              margin: getMargin(
                                  left: 24, top: 13, right: 24, bottom: 13),
                              onTap: () {
                                onTapLightbulb();
                              })
                        ]),
                    body: SingleChildScrollView(
                      child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          onTapRowsearch();
                                        },
                                        child: Container(
                                            margin: getMargin(
                                                left: 24, top: 30, right: 24),
                                            padding: getPadding(
                                                left: 16,
                                                top: 14,
                                                right: 16,
                                                bottom: 14),
                                            decoration: AppDecoration
                                                .outlineIndigo50
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgSearch,
                                                      height: getSize(18),
                                                      width: getSize(18),
                                                      margin: getMargin(
                                                          top: 2, bottom: 2)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8, top: 2),
                                                      child: Text(
                                                          "lbl_search".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansMedium16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08)))),
                                                  Spacer(),
                                                  SizedBox(
                                                      height:
                                                          getVerticalSize(22),
                                                      child: VerticalDivider(
                                                          width:
                                                              getHorizontalSize(
                                                                  1),
                                                          thickness:
                                                              getVerticalSize(
                                                                  1),
                                                          color: ColorConstant
                                                              .indigo50,
                                                          indent:
                                                              getHorizontalSize(
                                                                  2),
                                                          endIndent:
                                                              getHorizontalSize(
                                                                  2))),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgSettingsGray900,
                                                      height: getSize(18),
                                                      width: getSize(18),
                                                      margin: getMargin(
                                                          left: 7,
                                                          top: 2,
                                                          bottom: 2))
                                                ])))),
                                Padding(
                                    padding: getPadding(left: 24, top: 25),
                                    child: Text("lbl_recommendation".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansSemiBold18
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.09)))),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        height: getVerticalSize(193),
                                        child: Obx(() => ListView.separated(
                                            padding:
                                                getPadding(left: 24, top: 17),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                  height: getVerticalSize(16));
                                            },
                                            itemCount: controller
                                                .homeModelObj
                                                .value
                                                .listuserItemList
                                                .value
                                                .length,
                                            itemBuilder: (context, index) {
                                              ListuserItemModel model =
                                                  controller
                                                      .homeModelObj
                                                      .value
                                                      .listuserItemList
                                                      .value[index];
                                              return ListuserItemWidget(model);
                                            })))),
                                Padding(
                                    padding: getPadding(left: 24, top: 22),
                                    child: Text("lbl_recent_jobs".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterSemiBold16
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.08)))),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      height: getVerticalSize(300),
                                      child: Obx(
                                        () => controller.isLoading.value
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator()) // Show loading indicator if data is loading
                                            : ListView.builder(
                                                itemCount:
                                                    controller.jobsList.length,
                                                itemBuilder: (context, index) {
                                                  Job job = controller
                                                      .jobsList[index];
                                                  return YourJobWidget(
                                                      job: job);
                                                },
                                              ),
                                      ),
                                    )),
                              ])),
                    ));
              }
            }));
      } else {
        // Show the client home page if the user is a Client

        return SafeArea(child: Obx(() {
          if (controller.client.value == null) {
            print(
                "the client vlaue is null and here is : ${controller.client.value?.email}");
            return const Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
                backgroundColor: ColorConstant.whiteA70002,
                appBar: CustomAppBar(
                    height: getVerticalSize(50),
                    leadingWidth: 74,
                    leading: Obx(() => CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            controller.client.value?.photoUrl ?? "",
                          ),
                          radius: 25,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: controller.client.value?.photoUrl ?? "",
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.person),
                            ),
                          ),
                        )),
                    title: Padding(
                        padding: getPadding(left: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "Hi welcome back YOUR ARE A CLIENT ${controller.client.value?.firstname}", // the recent value of text "msg_hi_welcome_bac ".tr
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPlusJakartaSansBold14
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.07)))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(top: 9, right: 33),
                                      child: Text(
                                          "$controller.{client.value?.bio}", //   the recent value of text "msg_find_your_dream".tr
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPlusJakartaSansMedium12
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.06)))))
                            ])),
                    actions: [
                      AppbarImage(
                          height: getSize(24),
                          width: getSize(24),
                          svgPath: ImageConstant.imgLightbulb,
                          margin: getMargin(
                              left: 24, top: 13, right: 24, bottom: 13),
                          onTap: () {
                            onTapLightbulb();
                          })
                    ]),
                body: Stack(children: [
                  SingleChildScrollView(
                      child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          onTapRowsearch();
                                        },
                                        child: Container(
                                            margin: getMargin(
                                                left: 24, top: 30, right: 24),
                                            padding: getPadding(
                                                left: 16,
                                                top: 14,
                                                right: 16,
                                                bottom: 14),
                                            decoration: AppDecoration
                                                .outlineIndigo50
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder24),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgSearch,
                                                      height: getSize(18),
                                                      width: getSize(18),
                                                      margin: getMargin(
                                                          top: 2, bottom: 2)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8, top: 2),
                                                      child: Text(
                                                          "lbl_search".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPlusJakartaSansMedium16
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.08)))),
                                                  Spacer(),
                                                  SizedBox(
                                                      height:
                                                          getVerticalSize(22),
                                                      child: VerticalDivider(
                                                          width:
                                                              getHorizontalSize(
                                                                  1),
                                                          thickness:
                                                              getVerticalSize(
                                                                  1),
                                                          color: ColorConstant
                                                              .indigo50,
                                                          indent:
                                                              getHorizontalSize(
                                                                  2),
                                                          endIndent:
                                                              getHorizontalSize(
                                                                  2))),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgSettingsGray900,
                                                      height: getSize(18),
                                                      width: getSize(18),
                                                      margin: getMargin(
                                                          left: 7,
                                                          top: 2,
                                                          bottom: 2))
                                                ])))),
                                Padding(
                                    padding: getPadding(left: 24, top: 25),
                                    child: Text("lbl_recommendation".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansSemiBold18
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.09)))),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        height: getVerticalSize(193),
                                        child: Obx(() => ListView.separated(
                                            padding:
                                                getPadding(left: 24, top: 17),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                  height: getVerticalSize(16));
                                            },
                                            itemCount: controller
                                                .homeModelObj
                                                .value
                                                .listuserItemList
                                                .value
                                                .length,
                                            itemBuilder: (context, index) {
                                              ListuserItemModel model =
                                                  controller
                                                      .homeModelObj
                                                      .value
                                                      .listuserItemList
                                                      .value[index];
                                              return ListuserItemWidget(model);
                                            })))),
                                Padding(
                                    padding: getPadding(left: 24, top: 22),
                                    child: Text("lbl_recent_jobs".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterSemiBold16
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.08)))),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      height: getVerticalSize(300),
                                      child: Obx(
                                        () => controller.isLoading.value
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator()) // Show loading indicator if data is loading
                                            : ListView.builder(
                                                itemCount: controller
                                                    .freelancersList.length,
                                                itemBuilder: (context, index) {
                                                  Freelancer freelancer =
                                                      controller
                                                              .freelancersList[
                                                          index];
                                                  return FreelancerCardWidget(
                                                      freelancer: freelancer);
                                                },
                                              ),
                                      ),
                                    )),
                              ]))),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CustomButton(
                        height: getVerticalSize(48),
                        width: getHorizontalSize(137),
                        text: "Post a new Job",
                        shape: ButtonShape.RoundedBorder20,
                        padding: ButtonPadding.PaddingT14,
                        onTap: () {
                          try {
                            //                            Get.offAll(
                            //   () => PublishJobScreen(),
                            //   arguments: {
                            //                             'uid': controller.client.value?.uid,
                            //                             'fullName': controller.client.value?.firstname,
                            //                             'imageUrl': controller.client.value?.photoUrl,
                            //                           }
                            // );
                            Get.toNamed(AppRoutes.publishJobScreen, arguments: {
                              'uid': controller.client.value?.uid,
                              'fullName': controller.client.value?.firstname,
                              'imageUrl': controller.client.value?.photoUrl,
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        fontStyle:
                            ButtonFontStyle.PlusJakartaSansSemiBold14Gray50,
                        prefixWidget: Container(
                            margin: getMargin(right: 4),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgPlus18x18))),
                  )
                ]));
          }
        }));
      }
    });
  }

  onTapColumngroup() {
    Get.toNamed(AppRoutes.jobDetailsScreen);
  }

  onTapRowsearch() {
    Get.toNamed(
      AppRoutes.searchScreen,
    );
  }

  onTapLightbulb() {
    Get.toNamed(
      AppRoutes.notificationsGeneralScreen,
    );
  }
}
