import '../../models/Job.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_button.dart';

class JobDetailsScreen extends GetWidget<JobDetailsController> {
  final Job job = Get.arguments['job'];
  final String freelancerId = Get.arguments['freelancerId'];

  JobDetailsController controller = Get.put(JobDetailsController());

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
                      onTapArrowleft1();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_job_details".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgBookmark,
                      onTap: () {
                        controller.saveJob(job.id, freelancerId);
                        print("save printed");
                      },
                      margin:
                          getMargin(left: 16, top: 13, right: 16, bottom: 13))
                ]),
            body: Stack(children: [
              SingleChildScrollView(
                child: SizedBox(
                    height: getVerticalSize(900),
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: getMargin(
                                        right: 17,
                                        left: 17,
                                        top: 10,
                                        bottom: 0),
                                    padding: getPadding(
                                        left: 10,
                                        top: 24,
                                        right: 10,
                                        bottom: 24),
                                    decoration: AppDecoration.outlineIndigo50
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder16),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: const EdgeInsets.all(0),
                                            color: ColorConstant.gray100,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder39),
                                            child: CircleAvatar(
                                              backgroundImage:
                                                  NetworkImage(job.imageUrl),
                                              radius: 24,
                                            ),
                                          ),
                                          Padding(
                                              padding: getPadding(top: 16),
                                              child: Text(" ${job.title}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPlusJakartaSansBold14Bluegray900
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.07)))),
                                          Padding(
                                              padding: getPadding(top: 7),
                                              child: Text("  ${job.fullName}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPlusJakartaSansMedium12
                                                      .copyWith(
                                                          letterSpacing:
                                                              getHorizontalSize(
                                                                  0.06)))),
                                          Padding(
                                              padding:
                                                  getPadding(left: 1, top: 12),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomButton(
                                                        height:
                                                            getVerticalSize(28),
                                                        width:
                                                            getHorizontalSize(
                                                                69),
                                                        text: " ${job.type}",
                                                        variant: ButtonVariant
                                                            .FillGray100,
                                                        shape: ButtonShape
                                                            .RoundedBorder8,
                                                        fontStyle: ButtonFontStyle
                                                            .InterRegular12Bluegray400),
                                                    CustomButton(
                                                        height:
                                                            getVerticalSize(28),
                                                        width:
                                                            getHorizontalSize(
                                                                104),
                                                        text:
                                                            " ${formatDate(job.publishedAt.toDate())}",
                                                        margin:
                                                            getMargin(left: 9),
                                                        variant: ButtonVariant
                                                            .FillGray100,
                                                        shape: ButtonShape
                                                            .RoundedBorder8,
                                                        fontStyle: ButtonFontStyle
                                                            .InterRegular12Bluegray400)
                                                  ]))
                                        ])),
                                SizedBox(
                                  height: getVerticalSize(200),
                                  child: Padding(
                                    padding: getPadding(
                                      left: 20,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        CustomIconButton(
                                          height: 68,
                                          width: 68,
                                          variant:
                                              IconButtonVariant.FillTealA70065,
                                          shape: IconButtonShape.CircleBorder24,
                                          padding:
                                              IconButtonPadding.PaddingAll12,
                                          child: CustomImageView(
                                            svgPath: ImageConstant.imgClock,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 15,
                                          ),
                                          child: Text(
                                            "Salary",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPlusJakartaSansMedium12Bluegray300
                                                .copyWith(
                                              letterSpacing: getHorizontalSize(
                                                0.6,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 9,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            "12\$ - 13\$",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtPlusJakartaSansSemiBold14Gray900
                                                .copyWith(
                                              letterSpacing: getHorizontalSize(
                                                0.07,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // to add skills required here
                                // Container(
                                //     height: getVerticalSize(69),
                                //     child: Obx(() => ListView.separated(
                                //         padding: getPadding(top: 25),
                                //         scrollDirection: Axis.horizontal,
                                //         separatorBuilder: (context, index) {
                                //           return SizedBox(
                                //               height: getVerticalSize(12));
                                //         },
                                //         itemCount: controller
                                //             .jobDetailsModelObj
                                //             .value
                                //             .listdescriptionItemList
                                //             .value
                                //             .length,
                                //         itemBuilder: (context, index) {
                                //           ListdescriptionItemModel model =
                                //               controller
                                //                   .jobDetailsModelObj
                                //                   .value
                                //                   .listdescriptionItemList
                                //                   .value[index];
                                //           return ListdescriptionItemWidget(model);
                                //         }))),
                                Padding(
                                    padding: getPadding(
                                      top: 20,
                                      left: 20,
                                    ),
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
                                    margin: getMargin(
                                        left: 15.5, top: 13, right: 15.5),
                                    child: Text(job.jobDescription,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansMedium14Gray600
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.07))))
                              ])),
                    ])),
              ),
              Positioned(
                child: Align(
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
                                  text: "lbl_apply_now".tr,
                                  margin: getMargin(bottom: 12),
                                  padding: ButtonPadding.PaddingAll17,
                                  fontStyle: ButtonFontStyle
                                      .PlusJakartaSansSemiBold16Gray50,
                                  onTap: () {
                                    onTapApplynow();
                                  })
                            ]))),
              )
            ])));
  }

  String formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays < 3) {
      if (difference.inHours < 24) {
        return '${difference.inHours}h ago';
      } else {
        return '${difference.inDays} days ago';
      }
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  onTapApplynow() {
    Get.toNamed(AppRoutes.applyJobScreen, arguments: job);
  }

  onTapArrowleft1() {
    Get.back();
  }
}
