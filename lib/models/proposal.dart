import 'package:cloud_firestore/cloud_firestore.dart';

import 'Freelancer.dart';

class Proposal {
  String id;
  String jobId;
  String portfolio;
  Freelancer freelancer;
  String coverLetter;
  String phoneNumber;
  double salary;
  Timestamp sendAt;

  Proposal({
    required this.id,
    required this.jobId,
    required this.portfolio,
    required this.freelancer,
    required this.coverLetter,
    required this.phoneNumber,
    required this.salary,
    required this.sendAt,
  });

  factory Proposal.fromJson(String id, Map<String, dynamic> data) {
    return Proposal(
      id: id,
      jobId: data['jobId'],
      portfolio: data['portfolio'],
      freelancer: data['freelancer'],
      coverLetter: data['coverLetter'],
      phoneNumber: data['phoneNumber'],
       salary: data['salary'],
      sendAt: data['sendAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'portfolio': portfolio,
      'freelancer': freelancer.toMap(),
      'coverLetter': coverLetter,
      'phoneNumber': phoneNumber,
      'salary' : salary ,
      'sendAt': sendAt,
    };
  }
}
