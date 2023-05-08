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

  factory Freelancer.fromDocumentSnapshot(DocumentSnapshot snapshot) {
Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Freelancer(
      uid: snapshot.id,
      firstname: data['firstname'],
      lastname: data['lastname'],
      email: data['email'],
      location: data['location'],
      bio: data['bio'],
      photoUrl: data['photoUrl'],
      isFreelancer: data['isFreelancer'],
      speciallization : data['speciallization'],
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
