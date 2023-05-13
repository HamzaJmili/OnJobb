import 'package:cloud_firestore/cloud_firestore.dart';

class Proposal {
  String id;
  String freelancerId;
  String jobId;
  String portfolio;
  String firstName;
  String lastName;
  String phoneNumber;
  DateTime sendAt;

  Proposal({
    required this.id,
    required this.freelancerId,
    required this.jobId,
    required this.portfolio,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.sendAt,
  });

  factory Proposal.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return Proposal(
      id: snapshot.id,
      freelancerId: data['freelancerId'],
      jobId: data['jobId'],
      portfolio: data['portfolio'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      phoneNumber: data['phoneNumber'],
      sendAt: data['sendAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'freelancerId': freelancerId,
      'jobId': jobId,
      'portfolio': portfolio,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'sendAt': sendAt,
    };
  }
}
