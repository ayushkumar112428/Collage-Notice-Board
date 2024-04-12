import 'package:cloud_firestore/cloud_firestore.dart';

class StudentData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchCashData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('student').get();

      List<Map<String, dynamic>> dataList =
          snapshot.docs.map((doc) => doc.data()).toList();

      return dataList;
    } catch (e) {
      return [];
    }
  }
}