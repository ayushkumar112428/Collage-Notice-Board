import 'package:cloud_firestore/cloud_firestore.dart';

class AdminData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchCashData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('admin').get();

      List<Map<String, dynamic>> dataList =
          snapshot.docs.map((doc) => doc.data()).toList();

      return dataList;
    } catch (e) {
      print('Error fetching cash data: $e');
      return [];
    }
  }
}

