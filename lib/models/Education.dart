import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  String idFreelancer;
  String school;
  String degree;
  String fieldOfStudy;
  DateTime startDate;
  DateTime endDate;

  Education({
    required this.idFreelancer,
    required this.school,
    required this.degree,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
  });

  factory Education.fromJson( Map<String, dynamic> data) {
    
    return Education(
      idFreelancer: data['idFreelancer'],
      school: data['school'],
      degree: data['degree'],
      fieldOfStudy: data['fieldOfStudy'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idFreelancer': idFreelancer,
      'school': school,
      'degree': degree,
      'fieldOfStudy': fieldOfStudy,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
