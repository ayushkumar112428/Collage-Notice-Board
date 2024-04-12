import 'package:collagenoticeboard/both/home_page.dart';
import 'package:collagenoticeboard/both/student_request.dart';
import 'package:collagenoticeboard/student/request.dart';
import 'package:collagenoticeboard/style.dart';
import 'package:flutter/material.dart';

class StudentBottomBar extends StatefulWidget {
  const StudentBottomBar({super.key});

  @override
  State<StudentBottomBar> createState() => _StudentBottomBarState();
}

class _StudentBottomBarState extends State<StudentBottomBar> {
  int _currentIndex = 0;
  List<Widget> iconList = [
    const HomePage(),
    const Request(),
    const StudentReques(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 50,
          centerTitle: true,
          backgroundColor: primeriColor,
          shadowColor: const Color.fromARGB(255, 114, 113, 112),
          elevation: 5,
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NOTICE  BOARD',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),
              ),
            ],
          ),
        ),
        body: Center(
        child: iconList[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primeriColor,
        unselectedItemColor: bottomIcon,
        unselectedIconTheme: const IconThemeData(size: 30),
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(size: 35),
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(label: "", icon: Icon(Icons.home_sharp,)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.local_post_office_outlined,)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.note_alt_outlined,)),
        ],
      ),
    );
  }
}