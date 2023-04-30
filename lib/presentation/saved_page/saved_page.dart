import '../saved_page/widgets/saved_item_widget.dart';
import 'controller/saved_controller.dart';
import 'models/saved_item_model.dart';
import 'models/saved_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class SavedPage extends StatelessWidget {
  SavedController controller = Get.put(SavedController(SavedModel().obs));

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
                      onTapArrowleft5();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_saved".tr)),
            body: Padding(
                padding: getPadding(left: 24, top: 30, right: 24),
                child: Obx(() => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(12));
                    },
                    itemCount: controller
                        .savedModelObj.value.savedItemList.value.length,
                    itemBuilder: (context, index) {
                      SavedItemModel model = controller
                          .savedModelObj.value.savedItemList.value[index];
                      return SavedItemWidget(model, onTapSaveJobDetails: () {
                        onTapSaveJobDetails();
                      });
                    })))));
  }

  onTapSaveJobDetails() {
    Get.toNamed(AppRoutes.savedDetailJobScreen);
  }

  onTapArrowleft5() {
    Get.back();
  }
}
