import 'package:collagenoticeboard/fetchdata/student_fetchdata.dart';
import 'package:collagenoticeboard/student/student_bottombar.dart';
import 'package:collagenoticeboard/style.dart';
import 'package:flutter/material.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  List<Map<String, dynamic>> listOfData = [];
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    var service =
        StudentData(); // Assuming CashService is your class that contains the fetchCashData method
    var fetchedData = await service.fetchCashData();
    setState(() {
      listOfData.addAll(fetchedData);
    });
  }
  @override
  Widget build(BuildContext context) {
    double hsize = MediaQuery.of(context).size.height;
    double wsize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Container(
        height: hsize * 0.45,
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "STUDENT",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: primeriColor),
              ),
              const SizedBox(height: 20,),
              const Text(
                "User Name : ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              TextFormField(
                controller: usernamecontroller,
                decoration: const InputDecoration(
                  hintText: 'Enter a username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Password : ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  hintText: 'Enter a password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async{
                  int i = 0;
                  bool username = false;
                  for (i; i < listOfData.length; i++) {
                    if (usernamecontroller.text == listOfData[i]['en']) {
                      username = true;
                      if(passwordcontroller.text == listOfData[i]['password']){
                        await Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const StudentBottomBar()));
                      }
                    }
                  }
                  if(username){
                    print("Enter Careate Password");
                  }else{
                    print("Enter Careate Username");
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
      )),
    );
  }
}