import 'package:cloud_firestore/cloud_firestore.dart';

import 'Skill.dart';


class Job {
   String id;
   String title;
   String jobDescription;
   DateTime publishedAt;
   List<Skill> skillsRequired;
   String type;
   int minSalary;
   int maxSalary;
   String idPublisher;

  Job({
   required this.id,
   required  this.idPublisher,
   required this.title,
   required this.jobDescription,
   required this.publishedAt,
   required this.skillsRequired,
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
      skillsRequired: List.from(data['skillsRequired'].map((skill) => Skill.fromMap(skill))),
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
      'skillsRequired': List<Map<String, dynamic>>.from(skillsRequired.map((skill) => skill.toMap())),
      'type': type,
      'minSalary': minSalary,
      'maxSalary': maxSalary,
    
    };
  }
}
