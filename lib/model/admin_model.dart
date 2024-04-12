import 'package:cloud_firestore/cloud_firestore.dart';

class AdminPost {
  final String? id;
  final String? name;
  final String? department;
  final String? notes;
  final String? date;
  final String? time;
  
  AdminPost(
      {required this.id,
      required this.name,
      required this.department, 
      required this.notes, 
      required this.date,
      required this.time,
      });

  static AdminPost fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return AdminPost(
      id: snapshot['id'],
      name: snapshot['name'],
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
      "department": department,
      "notes": notes,
      "date": date,
      "time": time,
    };
  }
}
