import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/Freelancer.dart';
import '../../models/Job.dart';
import '../../widgets/custom_button.dart';
import '../home_page/widgets/listuser_item_widget.dart';
import 'controller/home_controller.dart';
import 'freelancer_widget.dart';
import 'job_widget.dart';
import 'models/home_model.dart';
import 'models/listuser_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController(HomeModel().obs));
  final FirebaseAuth auth = FirebaseAuth.instance;
  // Freelancer? freelancer;
  String freelancerId = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.getCurrentUser();
    controller.getJobsAndClient();
    return Obx(() {
      if (controller.userisFreelancer.value == true) {
        // Show the freelancer home page if the user is a freelancer
        return SafeArea(
            key: _formKey,
            child: Obx(() {
              if (controller.freelancer.value == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                // freelancer = controller.freelancer.value;
            return  Scaffold(
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
                                  controller.freelancer.value?.photoUrl ?? "",
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
                              "Hi welcome back FREELANCER ${controller.freelancer.value?.firstname}",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansBold14.copyWith(
                                letterSpacing: getHorizontalSize(0.07),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: getPadding(top: 9, right: 33),
                              child: Text(
                                "${controller.freelancer.value?.bio}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPlusJakartaSansMedium12
                                    .copyWith(
                                  letterSpacing: getHorizontalSize(0.06),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      AppbarImage(
                        height: getSize(24),
                        width: getSize(24),
                        svgPath: ImageConstant.imgLightbulb,
                        margin:
                            getMargin(left: 24, top: 13, right: 24, bottom: 13),
                        onTap: () {
                          onTapLightbulb();
                        },
                      ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: getPadding(left: 2, right: 2, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: getMargin(bottom: 25),
                            padding: getPadding(left: 16, right: 16),
                            decoration: AppDecoration.outlineIndigo50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder24,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgSearch,
                                  height: getSize(18),
                                  width: getSize(18),
                                  margin: getMargin(right: 8),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller:controller.searchText,
                                    decoration: InputDecoration(
                                      hintText: "lbl_search".tr,
                                      hintStyle: AppStyle
                                          .txtPlusJakartaSansMedium16
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(0.08),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtPlusJakartaSansMedium16
                                        .copyWith(
                                      letterSpacing: getHorizontalSize(0.08),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "lbl_recommendation".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.txtPlusJakartaSansSemiBold18.copyWith(
                              letterSpacing: getHorizontalSize(0.09),
                            ),
                          ),
                          SizedBox(height: getVerticalSize(16)),
                          Container(
                            height: getVerticalSize(193),
                            child: Obx(() => ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(16));
                                  },
                                  itemCount: controller.homeModelObj.value
                                      .listuserItemList.value.length,
                                  itemBuilder: (context, index) {
                                    ListuserItemModel model = controller
                                        .homeModelObj
                                        .value
                                        .listuserItemList
                                        .value[index];
                                    return ListuserItemWidget(model);
                                  },
                                )),
                          ),
                          SizedBox(height: getVerticalSize(22)),
                          Text(
                            "lbl_recent_jobs".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterSemiBold16.copyWith(
                              letterSpacing: getHorizontalSize(0.08),
                            ),
                          ),
                          SizedBox(height: getVerticalSize(10)),
                          SizedBox(
                            height: getVerticalSize(300),
                            child: Obx(
                              () => controller.isLoading.value
                                  ? Center(child: CircularProgressIndicator())
                                  : ListView.builder(
                                      itemCount: controller.filteredJobsList.length,
                                      itemBuilder: (context, index) {
                                        Job job = controller.jobsList[index];
                                        return YourJobWidget(
                                          job: job,
                                          freelancerId: controller
                                                  .freelancer.value?.uid ??
                                              '',
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
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
            print(controller.client.value?.uid);
                // freelancer = controller.freelancer.value;
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
          errorWidget: (context, url, error) => const Icon(Icons.person),
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
              "Hi welcome back Client ${controller.client.value?.firstname}",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPlusJakartaSansBold14.copyWith(
                letterSpacing: getHorizontalSize(0.07),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: getPadding(top: 9, right: 33),
              child: Text(
                "${controller.client.value?.bio}",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPlusJakartaSansMedium12.copyWith(
                  letterSpacing: getHorizontalSize(0.06),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      AppbarImage(
        height: getSize(24),
        width: getSize(24),
        svgPath: ImageConstant.imgLightbulb,
        margin: getMargin(left: 24, top: 13, right: 24, bottom: 13),
        onTap: () {
          onTapLightbulb();
        },
      ),
    ],
  ),
  body: SingleChildScrollView(
    child: Padding(
      padding: getPadding(left: 2, right: 2, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: getMargin(bottom: 25),
            padding: getPadding(left: 16, right: 16),
            decoration: AppDecoration.outlineIndigo50.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder24,
            ),
            child: Row(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgSearch,
                  height: getSize(18),
                  width: getSize(18),
                  margin: getMargin(right: 8),
                ),
                Expanded(
                  child: TextField(
                    controller: controller.searchText,
                    decoration: InputDecoration(
                      hintText: "lbl_search".tr,
                      hintStyle: AppStyle.txtPlusJakartaSansMedium16.copyWith(
                        letterSpacing: getHorizontalSize(0.08),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPlusJakartaSansMedium16.copyWith(
                      letterSpacing: getHorizontalSize(0.08),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "lbl_recommendation".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPlusJakartaSansSemiBold18.copyWith(
              letterSpacing: getHorizontalSize(0.09),
            ),
          ),
          SizedBox(height: getVerticalSize(16)),
          Container(
            height: getVerticalSize(193),
            child: Obx(() => ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(height: getVerticalSize(16));
              },
              itemCount: controller.homeModelObj.value.listuserItemList.value.length,
              itemBuilder: (context, index) {
                ListuserItemModel model = controller.homeModelObj.value.listuserItemList.value[index];
                return ListuserItemWidget(model);
              },
            )),
          ),
          SizedBox(height: getVerticalSize(22)),
          Text(
            "lbl_recent_jobs".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterSemiBold16.copyWith(
              letterSpacing: getHorizontalSize(0.08),
            ),
          ),
          SizedBox(height: getVerticalSize(10)),
          SizedBox(
            height: getVerticalSize(300),
            child: Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.filteredFreelancersList.length,
                      itemBuilder: (context, index) {
                        Freelancer freelancer = controller.filteredFreelancersList[index];
                        return FreelancerCardWidget(freelancer: freelancer);
                      },
                    ),
            ),
          ),
        ],
      ),
    ),
  ),
  floatingActionButton: Positioned(
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
          Get.toNamed(AppRoutes.publishJobScreen, arguments: {
            'uid': controller.client.value?.uid,
            'fullName': controller.client.value?.firstname,
            'imageUrl': controller.client.value?.photoUrl,
          });
        } catch (e) {
          print(e);
        }
      },
      fontStyle: ButtonFontStyle.PlusJakartaSansSemiBold14Gray50,
      prefixWidget: Container(
        margin: getMargin(right: 4),
        child: CustomImageView(svgPath: ImageConstant.imgPlus18x18),
      ),
    ),
  ),
);

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
