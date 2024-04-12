import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collagenoticeboard/model/admin_model.dart';
import 'package:collagenoticeboard/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminPostNotes extends StatefulWidget {
  const AdminPostNotes({super.key});

  @override
  State<AdminPostNotes> createState() => _AdminPostNotesState();
}

class _AdminPostNotesState extends State<AdminPostNotes> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    nameController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Name : ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 7,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter a name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Department : ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 7,
            ),
            TextField(
              controller: departmentController,
              decoration: const InputDecoration(
                hintText: 'Enter a department name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Notes : ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: notesController,
              maxLines:
                  null, // Allows the input field to expand as the user types
              decoration: const InputDecoration(
                hintText: 'Type notes...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    departmentController.text.isNotEmpty &&
                    notesController.text.isNotEmpty) {
                  createData();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primeriColor,
                elevation: 3,
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createData() {
    final cashCollection = FirebaseFirestore.instance.collection("adminposts");
    String id = cashCollection.doc().id;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    final newData = AdminPost(
      id: id,
      name: nameController.text,
      department: departmentController.text,
      notes: notesController.text,
      date: formattedDate,
      time: formattedTime,
    ).toJson();
    cashCollection.doc(id).set(newData);
    textClear();
  }

  void textClear() {
    nameController.clear();
    departmentController.clear();
    notesController.clear();
  }
}
