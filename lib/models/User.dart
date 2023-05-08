import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String firstname;
  String lastname;
  String email;
  String location;
  String bio;
  String photoUrl;
  bool isFreelancer;

  User({
    required this.uid,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.location,
    required this.bio,
    required this.photoUrl,
    required this.isFreelancer,
  });

  factory User.fromDocumentSnapshot(DocumentSnapshot doc) {
Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return User(
      uid: doc.id,
      firstname: data['firstname'],
      lastname: data['lastname'],
      email: data['email'],
      location: data['location'],
      bio:data['bio'],
      isFreelancer: data['isFreelancer'],
      photoUrl: data['photoUrl'],
    );
  }
}
