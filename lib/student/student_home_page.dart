import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collagenoticeboard/style.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final CollectionReference studentHomePage =
      FirebaseFirestore.instance.collection('adminposts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: studentHomePage.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return studentHomeBox(
                    documentSnapshot['name'],
                    documentSnapshot['department'],
                    documentSnapshot['notes'],
                    documentSnapshot['date'],
                    documentSnapshot['time']);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget studentHomeBox(
      String name, String department, String notes, String date, String time) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.outer),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        department,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    notes,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Divider(),
                  Text(
                    "Date: $date || Time: $time",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: bottomIcon),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
