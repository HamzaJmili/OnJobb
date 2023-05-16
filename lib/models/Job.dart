import 'package:cloud_firestore/cloud_firestore.dart';


class Job {
  String id;
  String title;
  String jobDescription;
  DateTime publishedAt;

  String type;
  int minSalary;
  int maxSalary;
  String idPublisher;

  Job({
    required this.id,
    required this.idPublisher,
    required this.title,
    required this.jobDescription,
    required this.publishedAt,
    required this.type,
    required this.minSalary,
    required this.maxSalary,
  });

  factory Job.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Job(
      id: snapshot.id,
      idPublisher: data['idPublisher'],
      title: data['title'],
      jobDescription: data['jobDescription'],
      publishedAt: data['publishedAt'],
    
      type: data['type'],
      minSalary: data['minSalary'],
      maxSalary: data['maxSalary'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idPublisher': idPublisher,
      'title': title,
      'jobDescription': jobDescription,
      'publishedAt': publishedAt,
      'type': type,
      'minSalary': minSalary,
      'maxSalary': maxSalary,
    };
  }
}
