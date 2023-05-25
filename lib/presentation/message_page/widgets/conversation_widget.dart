import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/Message.dart';
import '../../chat_screen/chat_screen.dart';

class ConversationWidget extends StatelessWidget {
  final Map<String, dynamic> user;
  final Message message;

  ConversationWidget({required this.user, required this.message});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          print(" user uid passed in arguments : ${user['uid']}");
          Get.to(() => ChatScreen(), arguments: user);
        } catch (e) {
          print("error is : $e");
        }
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user['photoUrl']),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user['firstname'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                message.text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            formatDate(message.sendAt.toDate()),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays < 3) {
      if (difference.inHours < 1) {
        if (difference.inMinutes < 1) {
          return 'Just now';
        } else {
          return '${difference.inMinutes} minutes ago';
        }
      } else if (difference.inHours < 24) {
        return '${difference.inHours} hours ago';
      } else {
        return '${difference.inDays} days ago';
      }
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
