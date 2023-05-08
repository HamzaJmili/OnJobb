import 'package:cloud_firestore/cloud_firestore.dart';

import 'User.dart';

class Client extends User {
 
  
  Client({
  required  String uid,
  required  String firstname,
  required  String lastname,
  required  String email,
  required String location,
  required String bio ,
  required  String photoUrl,
      bool isFreelancer = false,
  }) : super(
         uid: uid,
         firstname: firstname,
         lastname: lastname,
         email: email,
         location:location,
         bio:bio,
         photoUrl: photoUrl,
         isFreelancer: isFreelancer,
       );
       
  factory Client.fromDocumentSnapshot(DocumentSnapshot snapshot) {
Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Client(
      uid: snapshot.id,
      firstname: data['firstname'],
      lastname: data['lastname'],
      email: data['email'],
      location:data['location'],
      bio:data['bio'],
      photoUrl: data['photoUrl'],
      isFreelancer: data['isFreelancer'],
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'location':location,
      'bio':bio,
      'photoUrl': photoUrl,
      'isFreelancer': isFreelancer,
    };
  }
}