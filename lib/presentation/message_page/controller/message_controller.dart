import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/presentation/message_page/models/message_model.dart';

import '../../../models/Client.dart';
import '../../../models/Freelancer.dart';
import '../../../models/Message.dart';

class MessageController extends GetxController {
  MessageController(this.messageModelObj);

  Rx<MessageModel> messageModelObj;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String currentUserID = '';
  Rx<bool> isLoading = true.obs;
  final RxList<Message> messages = <Message>[].obs;
  Rx<Client?> client = Rx<Client?>(null);
  Rx<Freelancer?> freelancer = Rx<Freelancer?>(null);
  Rx<bool> userisFreelancer = true.obs;

  // ChatController({required this.currentUserID});
  Future<void> getCurrentUser() async {
    try {
      User user = auth.currentUser!;
      currentUserID = user.uid;
    } catch (e) {
      print(e);
    }
  }

  // to get the other user to dispaly his name and image profile in conversation widget
  Future<Map<String, dynamic>> getOtherUser(String id) async {
    DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(id);

    final docSnapshot = await userDocRef.get();
    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    data['uid'] = docSnapshot.id;

    return data;
  }

  Future<void> fetchMessages() async {
    isLoading.value = true;
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('messages')
          .where('senderId', isEqualTo: currentUserID)
          .orderBy('sendAt', descending: true)
          .get();

      final conversations = querySnapshot.docs;

      final List<Message> allMessages = [];
      for (final doc in conversations) {
        final receiverID = doc['receiverId'] as String;
        final senderID = doc['senderId'] as String;
        final messageText = doc['text'] as String;
        final sendAt = doc['sendAt'] as Timestamp;

        final message = Message(
          senderId: senderID,
          receiverId: receiverID,
          text: messageText,
          sendAt: sendAt,
        );
        allMessages.add(message);
      }

      final additionalQuerySnapshot = await FirebaseFirestore.instance
          .collection('messages')
          .where('receiverId', isEqualTo: currentUserID)
          .orderBy('sendAt', descending: true)
          .get();

      final additionalConversations = additionalQuerySnapshot.docs;

      for (final doc in additionalConversations) {
        final receiverID = doc['receiverId'] as String;
        final senderID = doc['senderId'] as String;
        final messageText = doc['text'] as String;
        final sendAt = doc['sendAt'] as Timestamp;

        final message = Message(
          senderId: senderID,
          receiverId: receiverID,
          text: messageText,
          sendAt: sendAt,
        );
        allMessages.add(message);
      }

      final filteredMessages = <Message>[];

      for (final message in allMessages) {
        final otherUserID = message.senderId == currentUserID
            ? message.receiverId
            : message.senderId;

        final existingIndex = filteredMessages.indexWhere(
          (m) =>
              (m.senderId == currentUserID && m.receiverId == otherUserID) ||
              (m.senderId == otherUserID && m.receiverId == currentUserID),
        );

        if (existingIndex != -1) {
          final existingMessage = filteredMessages[existingIndex];
          if (message.sendAt.compareTo(existingMessage.sendAt) > 0) {
            filteredMessages[existingIndex] = message;
          }
        } else {
          filteredMessages.add(message);
        }
      }

      // Sort messages by sendAt in descending order
      filteredMessages.sort((a, b) => b.sendAt.compareTo(a.sendAt));

      messages.clear();
      messages.addAll(filteredMessages);
      print('the last messages with each user');
      for (var message in messages) {
        print(message.text);
      }
    } catch (e) {
      // Handle error
    }
        isLoading.value = false;

  }

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    fetchMessages();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
