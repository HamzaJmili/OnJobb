import '../search_screen/widgets/search_item_widget.dart';
import 'controller/search_controller.dart';
import 'models/search_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/presentation/filter_bottomsheet/filter_bottomsheet.dart';
import 'package:onjobb/presentation/filter_bottomsheet/controller/filter_controller.dart';

class SearchScreen extends GetWidget<SearchController> {
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
                      onTapArrowleft();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_find_jobs".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, right: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: getMargin(top: 30),
                          padding: getPadding(
                              left: 16, top: 14, right: 16, bottom: 14),
                          decoration: AppDecoration.outlineIndigo50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder24),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgSearch,
                                    height: getSize(18),
                                    width: getSize(18),
                                    margin: getMargin(top: 2, bottom: 2)),
                                Padding(
                                    padding: getPadding(left: 8, top: 2),
                                    child: Text("lbl_search".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPlusJakartaSansMedium16
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.08)))),
                                Spacer(),
                                SizedBox(
                                    height: getVerticalSize(22),
                                    child: VerticalDivider(
                                        width: getHorizontalSize(1),
                                        thickness: getVerticalSize(1),
                                        color: ColorConstant.indigo50,
                                        indent: getHorizontalSize(2),
                                        endIndent: getHorizontalSize(2))),
                                CustomImageView(
                                    svgPath: ImageConstant.imgSettingsGray900,
                                    height: getSize(18),
                                    width: getSize(18),
                                    margin:
                                        getMargin(left: 7, top: 2, bottom: 2),
                                    onTap: () {
                                      onTapImgSettings();
                                    })
                              ])),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(12));
                              },
                              itemCount: controller.searchModelObj.value
                                  .searchItemList.value.length,
                              itemBuilder: (context, index) {
                                SearchItemModel model = controller
                                    .searchModelObj
                                    .value
                                    .searchItemList
                                    .value[index];
                                return SearchItemWidget(model,
                                    onTapRowlightbulb: () {
                                  onTapRowlightbulb();
                                });
                              })))
                    ]))));
  }

  onTapRowlightbulb() {
    Get.toNamed(AppRoutes.savedDetailJobScreen);
  }

  onTapImgSettings() {
    Get.bottomSheet(
      FilterBottomsheet(
        Get.put(
          FilterController(),
        ),
      ),
      isScrollControlled: true,
    );
  }

  onTapArrowleft() {
    Get.back();
  }
}
