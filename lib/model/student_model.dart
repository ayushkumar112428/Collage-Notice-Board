import 'package:cloud_firestore/cloud_firestore.dart';

class StudentRequests {
  final String? id;
  final String? name;
  final String? en;
  final String? department;
  final String? notes;
  final String? date;
  final String? time;
  
  StudentRequests(
      {required this.id,
      required this.name,
      required this.en, 
      required this.department, 
      required this.notes, 
      required this.date,
      required this.time,
      });

  static StudentRequests fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return StudentRequests(
      id: snapshot['id'],
      name: snapshot['name'],
      en: snapshot['en'],
      department: snapshot['department'],
      notes: snapshot['notes'],
      date: snapshot['date'],
      time: snapshot['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "en": en,
      "department": department,
      "notes": notes,
      "date": date,
      "time": time,
    };
  }
}
