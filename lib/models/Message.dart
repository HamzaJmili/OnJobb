import 'package:cloud_firestore/cloud_firestore.dart';

class Message {

  String senderId;
  String receiverId;
  String text;
  Timestamp sendAt;

  Message({
    
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.sendAt,
  });

  factory Message.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Message(
      
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
factory Message.fromMap(Object? map) {
  if (map == null) {
    // Handle the case when the map is null
    return Message(
      senderId: '',
      receiverId: '',
      text: '',
      sendAt: Timestamp.now(),
    );
  }

  final data = Map<String, dynamic>.from(map as Map<dynamic, dynamic>);

  return Message(
    senderId: data['senderId']?.toString() ?? '',
    receiverId: data['receiverId']?.toString() ?? '',
    text: data['text']?.toString() ?? '',
    sendAt: data['sendAt'] as Timestamp? ?? Timestamp.now(),
  );
}


}
