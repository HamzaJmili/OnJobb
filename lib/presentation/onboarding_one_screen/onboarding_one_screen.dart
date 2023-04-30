import '../onboarding_one_screen/widgets/sliderthebestappfor_item_widget.dart';
import 'controller/onboarding_one_controller.dart';
import 'models/sliderthebestappfor_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingOneScreen extends GetWidget<OnboardingOneController> {
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
                              height: getVerticalSize(678),
                              width: getHorizontalSize(327),
                              margin: getMargin(top: 13, bottom: 5),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgImage,
                                        height: getVerticalSize(361),
                                        width: getHorizontalSize(283),
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
                                                              .onboardingOneModelObj
                                                              .value
                                                              .sliderthebestappforItemList
                                                              .value
                                                              .length,
                                                          itemBuilder: (context,
                                                              index,
                                                              realIndex) {
                                                            SliderthebestappforItemModel
                                                                model =
                                                                controller
                                                                    .onboardingOneModelObj
                                                                    .value
                                                                    .sliderthebestappforItemList
                                                                    .value[index];
                                                            return SliderthebestappforItemWidget(
                                                                model,
                                                                onTapBtnNextvalue:
                                                                    () {
                                                              onTapBtnNextvalue();
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
                                                                  .onboardingOneModelObj
                                                                  .value
                                                                  .sliderthebestappforItemList
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

  onTapBtnNextvalue() {
    Get.toNamed(AppRoutes.onboardingTwoScreen);
  }

  onTapTxtMediumlabelmedi() {
    Get.toNamed(
      AppRoutes.signUpCreateAcountScreen,
    );
  }
}
