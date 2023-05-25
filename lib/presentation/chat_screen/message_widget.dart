import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../models/Message.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final bool isMe;
  final String imageUrl;

  MessageWidget(
      {required this.message, required this.isMe, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMd().format(message.sendAt.toDate());
    String formattedTime = DateFormat.Hm().format(message.sendAt.toDate());
    String displayTime =
        formattedDate == DateFormat.yMd().format(DateTime.now())
            ? formattedTime
            : '$formattedDate $formattedTime';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 16,
            ),
        const  SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isMe ? const Color.fromRGBO(17, 17, 64, 1) : ColorConstant.gray100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: isMe ? TextStyle(
          color: ColorConstant.gray50,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.29,
          ),
        ) : AppStyle.txtPlusJakartaSansMedium14Gray600 .copyWith(letterSpacing:getHorizontalSize( 0.07),)
                  ),
                 const SizedBox(height: 4),
                  Text(
                    displayTime,
                   style: AppStyle.txtPlusJakartaSansMedium10.copyWith(letterSpacing: getHorizontalSize(0.05))
                  ),
                ],
              ),
            ),
          ),
          if (isMe)
            Container(
              margin: const EdgeInsets.only(left : 8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 16,
              ),
            ),
         const SizedBox(width: 8),
        ],
      ),
    );
  }
}
