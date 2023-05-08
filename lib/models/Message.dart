
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id;
  String senderId;
  String receiverId;
  String text;
  DateTime sendAt;

  Message({
   required this.id,
  required this.senderId,
   required this.receiverId,
   required this.text,
   required this.sendAt,
  });

  factory Message.fromDocumentSnapshot(DocumentSnapshot snapshot) {
Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Message(
      id: snapshot.id,
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      text: data['text'],
      sendAt: data['sendAt'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'sendAt': sendAt,
    };
  }
}
