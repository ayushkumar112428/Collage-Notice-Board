import 'package:collagenoticeboard/auth/admin.dart';
import 'package:collagenoticeboard/auth/student.dart';
import 'package:collagenoticeboard/style.dart';
import 'package:flutter/material.dart';

class AdminStudentSelect extends StatelessWidget {
  const AdminStudentSelect({super.key});

  @override
  Widget build(BuildContext context) {
    double hsize = MediaQuery.of(context).size.height;
    double wsize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Container(
          height: hsize * 0.5,
          width: wsize * 0.8,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.outer),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.handshake,
                  size: 80,
                  color: primeriColor,
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Select",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Admin or Student",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const AdminLogin()));
                  },
                  child: selectBox("ADMIN")),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "or",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>const StudentLogin()));
                  },
                  child: selectBox("STUDENT")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectBox(String title) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: primeriColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}
