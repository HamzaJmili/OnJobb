import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/chat_screen/models/chat_model.dart';
import 'package:flutter/material.dart';

import '../../../models/Client.dart';
import '../../../models/Freelancer.dart';
import '../../../models/Message.dart';

class ChatController extends GetxController {
  TextEditingController messageText = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Rx<Client?> client = Rx<Client?>(null);
  Rx<Freelancer?> freelancer = Rx<Freelancer?>(null);

  Rx<ChatModel> chatModelObj = ChatModel().obs;
  String senderimageUrl = '';
  String idSender = ''; // Replace 'senderId' with your actual sender ID

  final RxList<Message> messages = <Message>[].obs;

  Future<void> getCurrentUser() async {
    try {
      User user = auth.currentUser!;
      idSender = user.uid;
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      final docSnapshot = await userDocRef.get();
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      if (data['isFreelancer'] == false) {
        client.value = Client.fromJson(docSnapshot.id, data);
        senderimageUrl = client.value?.photoUrl ?? '';
      } else if (data['isFreelancer'] == true) {
        freelancer.value = Freelancer.fromJson(docSnapshot.id, data);
        senderimageUrl = freelancer.value?.photoUrl ?? '';
      }
    } catch (e) {
      print(e);
    }
  }

  void sendMessage(String receiverId) {
    if (messageText.value.text.isNotEmpty) {
      final message = Message(
        senderId: idSender,
        receiverId: receiverId,
        text: messageText.value.text,
        sendAt: Timestamp.now(),
      );

      FirebaseFirestore.instance.collection('messages').add(message.toMap());
      messageText.clear();
    } else {
      print('message text is empty');
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getCurrentUser();
  }

  @override
  void onClose() {
    super.onClose();
    messageText.dispose();
  }
}
