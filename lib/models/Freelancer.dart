import 'package:cloud_firestore/cloud_firestore.dart';

import 'User.dart';

class Freelancer extends User {
  String speciallization;  // to think if it should of client side too 
  // Skills[skill] + Saved Jobs 

  Freelancer({
    required String uid,
    required String firstname,
    required String lastname,
    required String email,
    required String location,
     required String bio,
    required String photoUrl,
    bool isFreelancer = false,

   
    required this.speciallization,
  }) : super(
          uid: uid,
          firstname: firstname,
          lastname: lastname,
          email: email,
          location: location,
          bio: bio, 
          photoUrl: photoUrl,
          isFreelancer: isFreelancer,
        );

   factory Freelancer.fromJson(Map<String, dynamic> json) {
    return Freelancer(
      uid: 'id',
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      location: json['location'],
      bio: json['bio'],
      photoUrl: json['photoUrl'],
      isFreelancer: json['isFreelancer'] ,
      speciallization: json['speciallization'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'location': location,
      'bio': bio,
      'photoUrl': photoUrl,
      'isFreelancer': isFreelancer,
      'speciallization':speciallization,
    };
  }
}
