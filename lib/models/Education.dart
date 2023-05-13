import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  String id;
  String school;
  String degree;
  String fieldOfStudy;
  String grade;
  DateTime startDate;
  DateTime endDate;

  Education({
    required this.id,
    required this.school,
    required this.degree,
    required this.fieldOfStudy,
    required this.grade,
    required this.startDate,
    required this.endDate,
  });

  factory Education.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Education(
      id: snapshot.id,
      school: data['school'],
      degree: data['degree'],
      fieldOfStudy: data['fieldOfStudy'],
      grade: data['grade'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'school': school,
      'degree': degree,
      'fieldOfStudy': fieldOfStudy,
      'grade': grade,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
