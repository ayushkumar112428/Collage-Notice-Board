import 'package:collagenoticeboard/admin/post.dart';
import 'package:collagenoticeboard/both/home_page.dart';
import 'package:collagenoticeboard/both/student_request.dart';
import 'package:collagenoticeboard/style.dart';
import 'package:flutter/material.dart';

class AdminBottomBar extends StatefulWidget {
  const AdminBottomBar({super.key});

  @override
  State<AdminBottomBar> createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
  int _currentIndex = 0;
  List<Widget> iconList = [
    const HomePage(),
    const AdminPostNotes(),
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
          BottomNavigationBarItem(label: "", icon: Icon(Icons.add_box_outlined,)),
          // BottomNavigationBarItem(label: "", icon: Icon(Icons.note_alt_outlined,)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.perm_contact_cal,)),
        ],
      ),
    );
  }
}