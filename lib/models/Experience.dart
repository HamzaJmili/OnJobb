import 'package:cloud_firestore/cloud_firestore.dart';

class Experience {
  String id;
  String title;
  String companyName;
  String location;
  String jobPost;
  DateTime startDate;
  DateTime endDate;

  Experience({
    required this.id,
    required this.title,
    required this.companyName,
    required this.location,
    required this.jobPost,
    required this.startDate,
    required this.endDate,
  });

  factory Experience.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Experience(
      id: snapshot.id,
      title: data['title'],
      companyName: data['companyName'],
      location: data['location'],
      jobPost: data['jobPost'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'companyName': companyName,
      'location': location,
      'jobPost': jobPost,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
