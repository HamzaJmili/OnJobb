import '../onboarding_two_screen/widgets/slidermessage_item_widget.dart';
import 'controller/onboarding_two_controller.dart';
import 'models/slidermessage_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingTwoScreen extends GetWidget<OnboardingTwoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgOnboardingone),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 24, top: 18, right: 24, bottom: 18),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                onTapTxtMediumlabelmedi();
                              },
                              child: Text("lbl_skip".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPlusJakartaSansSemiBold14
                                      .copyWith(
                                          letterSpacing:
                                              getHorizontalSize(0.07)))),
                          Container(
                              height: getVerticalSize(672),
                              width: getHorizontalSize(327),
                              margin: getMargin(top: 19, bottom: 5),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgImage369x306,
                                        height: getVerticalSize(369),
                                        width: getHorizontalSize(306),
                                        alignment: Alignment.topCenter),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            height: getVerticalSize(335),
                                            width: getHorizontalSize(327),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Obx(() =>
                                                      CarouselSlider.builder(
                                                          options:
                                                              CarouselOptions(
                                                                  height:
                                                                      getVerticalSize(
                                                                          335),
                                                                  initialPage:
                                                                      0,
                                                                  autoPlay:
                                                                      true,
                                                                  viewportFraction:
                                                                      1.0,
                                                                  enableInfiniteScroll:
                                                                      false,
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  onPageChanged:
                                                                      (index,
                                                                          reason) {
                                                                    controller
                                                                        .silderIndex
                                                                        .value = index;
                                                                  }),
                                                          itemCount: controller
                                                              .onboardingTwoModelObj
                                                              .value
                                                              .slidermessageItemList
                                                              .value
                                                              .length,
                                                          itemBuilder: (context,
                                                              index,
                                                              realIndex) {
                                                            SlidermessageItemModel
                                                                model =
                                                                controller
                                                                    .onboardingTwoModelObj
                                                                    .value
                                                                    .slidermessageItemList
                                                                    .value[index];
                                                            return SlidermessageItemWidget(
                                                                model,
                                                                onTapBtnNextstep:
                                                                    () {
                                                              onTapBtnNextstep();
                                                            });
                                                          })),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Obx(() => Container(
                                                          height: getVerticalSize(
                                                              10),
                                                          margin: getMargin(
                                                              bottom: 112),
                                                          child: AnimatedSmoothIndicator(
                                                              activeIndex: controller
                                                                  .silderIndex
                                                                  .value,
                                                              count: controller
                                                                  .onboardingTwoModelObj
                                                                  .value
                                                                  .slidermessageItemList
                                                                  .value
                                                                  .length,
                                                              axisDirection: Axis
                                                                  .horizontal,
                                                              effect: ScrollingDotsEffect(
                                                                  spacing: 12,
                                                                  activeDotColor:
                                                                      ColorConstant
                                                                          .gray900,
                                                                  dotColor: ColorConstant
                                                                      .gray90068,
                                                                  dotHeight: getVerticalSize(10),
                                                                  dotWidth: getHorizontalSize(10))))))
                                                ])))
                                  ]))
                        ])))));
  }

  onTapBtnNextstep() {
    Get.toNamed(AppRoutes.onboardingThreeScreen);
  }

  onTapTxtMediumlabelmedi() {
    Get.toNamed(
      AppRoutes.signUpCreateAcountScreen,
    );
  }
}
