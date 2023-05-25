import 'controller/message_controller.dart';
import 'models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';

import 'widgets/conversation_widget.dart';

// ignore_for_file: must_be_immutable
class MessagePage extends StatelessWidget {
  MessageController controller = Get.put(MessageController(MessageModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA70002,
        appBar: CustomAppBar(
          height: getVerticalSize(51),
          leadingWidth: 48,
          leading: AppbarImage(
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgArrowleft,
            margin: getMargin(left: 24, top: 13, bottom: 14),
            onTap: () {
              onTapArrowleft2();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "lbl_message".tr),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              width: double.maxFinite,
              padding: getPadding(left: 24, top: 20, right: 24, bottom: 24),
              child: ListView.separated(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];

                  return FutureBuilder<Map<String, dynamic>>(
                    future: controller.getOtherUser(
                      message.senderId == controller.currentUserID
                          ? message.receiverId
                          : message.senderId,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        final user = snapshot.data!;
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: ConversationWidget(
                            user: user,
                            message: message,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return SizedBox();
                      }
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
              ),
            );
          }
        }),
      ),
    );
  }

  onTapRowdot() {
    Get.toNamed(AppRoutes.chatScreen);
  }

  onTapArrowleft2() {
    Get.back();
  }
}
