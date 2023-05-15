import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/models/Freelancer.dart';
import '../home_page/widgets/listgroup_item_widget.dart';
import '../home_page/widgets/listuser_item_widget.dart';
import 'controller/home_controller.dart';
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

   Rx<Freelancer?> freelancer = Rx<Freelancer?>(null);
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future<void> getCurrentUser() async {
      try {
        User user = auth.currentUser!;
        DocumentReference userDocRef =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        final docSnapshot = await userDocRef.get();
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        print(
            " print inside getCurentuser in home screen this  before put data in freelancer object");
        // print("${data['email']}");
        freelancer.value = Freelancer.fromJson(data);
        freelancer.value?.uid = docSnapshot.id;
        print(" print inside getCurentuser in home screen this ");
        print(freelancer.value?.uid);
        print(" print inside getCurentuser in home screen after  ");
      } catch (e) {
        print("print inside the catch of getuserController before print e ");
        print(e);
      }
    }

    getCurrentUser();

    return SafeArea(child: Obx(() {
      if (freelancer.value == null) {
        // Show a loading indicator while the freelancer value is null

        return Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
            backgroundColor: ColorConstant.whiteA70002,
            appBar: CustomAppBar(
                height: getVerticalSize(50),
                leadingWidth: 74,
                leading: Obx(() => CircleAvatar(
  backgroundImage: CachedNetworkImageProvider(
    freelancer.value?.photoUrl ?? "",
  ),
  radius: 25,
  child: ClipOval(
    child: CachedNetworkImage(
      imageUrl: freelancer.value?.photoUrl ?? "",
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => const  Icon(Icons.person),
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
                                  "Hi welcome back ${freelancer.value?.firstname}", // the recent value of text "msg_hi_welcome_bac ".tr
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
                                      "${freelancer.value?.bio}", //   the recent value of text "msg_find_your_dream".tr
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPlusJakartaSansMedium12
                                          .copyWith(
                                              letterSpacing:
                                                  getHorizontalSize(0.06)))))
                        ])),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgLightbulb,
                      margin:
                          getMargin(left: 24, top: 13, right: 24, bottom: 13),
                      onTap: () {
                        onTapLightbulb();
                      })
                ]),
            body: Container(
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
                                  margin:
                                      getMargin(left: 24, top: 30, right: 24),
                                  padding: getPadding(
                                      left: 16, top: 14, right: 16, bottom: 14),
                                  decoration: AppDecoration.outlineIndigo50
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder24),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgSearch,
                                            height: getSize(18),
                                            width: getSize(18),
                                            margin:
                                                getMargin(top: 2, bottom: 2)),
                                        Padding(
                                            padding:
                                                getPadding(left: 8, top: 2),
                                            child: Text("lbl_search".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPlusJakartaSansMedium16
                                                    .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.08)))),
                                        Spacer(),
                                        SizedBox(
                                            height: getVerticalSize(22),
                                            child: VerticalDivider(
                                                width: getHorizontalSize(1),
                                                thickness: getVerticalSize(1),
                                                color: ColorConstant.indigo50,
                                                indent: getHorizontalSize(2),
                                                endIndent:
                                                    getHorizontalSize(2))),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgSettingsGray900,
                                            height: getSize(18),
                                            width: getSize(18),
                                            margin: getMargin(
                                                left: 7, top: 2, bottom: 2))
                                      ])))),
                      Padding(
                          padding: getPadding(left: 24, top: 25),
                          child: Text("lbl_recommendation".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlusJakartaSansSemiBold18
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.09)))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              height: getVerticalSize(193),
                              child: Obx(() => ListView.separated(
                                  padding: getPadding(left: 24, top: 17),
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
                                  })))),
                      Padding(
                          padding: getPadding(left: 24, top: 22),
                          child: Text("lbl_recent_jobs".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold16.copyWith(
                                  letterSpacing: getHorizontalSize(0.08)))),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 24, top: 16, right: 24),
                              child: Obx(() => ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: getVerticalSize(16));
                                  },
                                  itemCount: controller.homeModelObj.value
                                      .listgroupItemList.value.length,
                                  itemBuilder: (context, index) {
                                    ListgroupItemModel model = controller
                                        .homeModelObj
                                        .value
                                        .listgroupItemList
                                        .value[index];
                                    return ListgroupItemWidget(model,
                                        onTapColumngroup: () {
                                      onTapColumngroup();
                                    });
                                  }))))
                    ])));
      }
    }));
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
