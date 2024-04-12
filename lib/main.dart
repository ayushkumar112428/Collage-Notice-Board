import 'package:collagenoticeboard/auth/admin_student.dart';
import 'package:collagenoticeboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AdminStudentSelect(),
    );
  }
}


// "Introducing the College Notice Board, a dynamic Flutter application designed to streamline communication within educational institutions. Powered by Firebase, this app provides a seamless experience for both administrators and students.

// On the Admin Side, administrators can effortlessly post notices and announcements, as well as manage student requests with ease. The admin dashboard displays a list of notices and pending requests for quick access and efficient management.

// For students, the app offers a convenient platform to stay updated on important information shared by administrators. Students can also submit requests to the admin, ensuring effective communication between both parties.

// With a sleek and intuitive interface, coupled with Firebase's robust data management capabilities using Firestore, the College Notice Board revolutionizes how colleges handle communication and information dissemination. Stay connected, informed, and organized like never before with the College Notice Board app."