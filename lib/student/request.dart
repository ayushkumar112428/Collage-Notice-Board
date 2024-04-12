import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collagenoticeboard/model/student_model.dart';
import 'package:collagenoticeboard/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Request extends StatefulWidget {
  final String? id;
  const Request({super.key, this.id});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final CollectionReference studentRequestData =
      FirebaseFirestore.instance.collection('studentRequest');
  // It's a good practice to dispose controllers to free up resources
  final TextEditingController nameController = TextEditingController();
  final TextEditingController enController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    nameController.dispose();
    enController.dispose();
    departmentController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: studentPost(),
    );
  }

  Padding studentPost() {
    return Padding(
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
            "EN : ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 7,
          ),
          TextField(
            controller: enController,
            decoration: const InputDecoration(
              hintText: 'Enter a enrollment number',
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
                  enController.text.isNotEmpty &&
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
    );
  }

  void createData() {
    final cashCollection =
        FirebaseFirestore.instance.collection("studentRequest");
    String id = cashCollection.doc().id;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    final newData = StudentRequests(
      id: id,
      name: nameController.text,
      en: enController.text,
      department: departmentController.text,
      notes: notesController.text,
      date: formattedDate,
      time: formattedTime,
    ).toJson();
    cashCollection.doc(id).set(newData);
    textClear();
  }

  void dataget(DocumentSnapshot ds) {
    nameController.text = ds['name'];
    enController.text = ds['en'];
    departmentController.text = ds['department'];
    notesController.text = ds['notes'];
  }

  void textClear() {
    nameController.clear();
    enController.clear();
    departmentController.clear();
    notesController.clear();
  }
}

// StreamBuilder(stream: studentRequestData.snapshots(), builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
//         if(streamSnapshot.hasData){
//           int no = 0;
//             int count = streamSnapshot.data!.docs.length;
//             for (no; no < count; no++) {
//               final DocumentSnapshot documentSnapshot =
//                   streamSnapshot.data!.docs[no];
//               final String indexId = documentSnapshot['id'];
//               if (widget.id == indexId) {
//                 break;
//               }
//             }
//             if(no < count){
//               DocumentSnapshot ds = streamSnapshot.data!.docs[no];
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//               dataget(ds);
//               });
//             }
//         }
//         return const Center(
//             child: CircularProgressIndicator(),
//           );
//       })
