import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../models/Message.dart';
import 'controller/chat_controller.dart';
import 'package:onjobb/widgets/app_bar/appbar_image.dart';
import 'package:onjobb/widgets/app_bar/appbar_title.dart';
import 'package:onjobb/widgets/app_bar/custom_app_bar.dart';
import 'package:onjobb/widgets/custom_text_form_field.dart';

import 'message_widget.dart';

class ChatScreen extends GetWidget<ChatController> {
  final Map<String, dynamic> receiver = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(" id sender : ${controller.idSender} id receiver : ${receiver['uid']}");
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              onTapArrowleft4();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(
              text: "${receiver['firstname']} ${receiver['lastname']}"),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .where('senderId',
                        whereIn: [controller.idSender, receiver['uid']])
                    .orderBy('sendAt', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Error fetching messages'));
                  }

                  final messages = snapshot.data?.docs ?? [];
                  final filteredMessages = messages
                      .where((message) =>
                          message['receiverId'] == receiver['uid'] ||
                          message['receiverId'] == controller.idSender)
                      .toList();

                  return ListView.builder(
                    reverse: true,
                    itemCount: filteredMessages.length,
                    itemBuilder: (context, index) {
                      final message =
                          Message.fromMap(filteredMessages[index].data());

                      bool isMe = message.senderId == controller.idSender;

                      return MessageWidget(
                        message: message,
                        isMe: isMe,
                        imageUrl: message.senderId == controller.idSender
                            ? controller.senderimageUrl
                            : receiver['photoUrl'],
                      );
                    },
                  );
                },
              ),
            ),
            // ... your existing code
          ],
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                focusNode: FocusNode(),
                controller: controller.messageText,
                hintText: "msg_type_your_messa".tr,
                margin: getMargin(left: 10, right: 6, bottom: 6),
                variant: TextFormFieldVariant.FillGray200,
                shape: TextFormFieldShape.CircleBorder28,
                padding: TextFormFieldPadding.PaddingAll20,
                fontStyle:
                    TextFormFieldFontStyle.PlusJakartaSansMedium12Gray6007c,
                textInputAction: TextInputAction.done,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imagesendmsg,
              onTap: () {
                print(
                    'message is ${controller.messageText.value.text} and receiver id is : ${receiver['uid']}');
                controller.sendMessage(receiver['uid']);
              },
              height: 30,
              margin: getMargin(left: 3, right: 6, bottom: 6),
            ),
          ],
        ),
      ),
    );
  }

  onTapArrowleft4() {
    Get.back();
  }
}
