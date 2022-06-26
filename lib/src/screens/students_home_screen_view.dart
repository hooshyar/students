import 'package:flutter/material.dart';
import 'package:students/mock/mock_data.dart';
import 'package:students/src/models/student_model.dart';
import 'package:students/src/screens/about_screen_view.dart';
import 'package:students/src/screens/students_details_screen_view.dart';
import 'package:students/src/screens/students_list_view.dart';
import 'package:students/src/screens/supports_screen_view.dart';

class StudentHomeScreenView extends StatefulWidget {
  StudentHomeScreenView({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreenView> createState() => _StudentHomeScreenViewState();
}

class _StudentHomeScreenViewState extends State<StudentHomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => StudentsListScreenView(),
        '/about': (context) => AboutScreenView(),
        '/supports': (context) => SupportersScreenView()
      },
    );
  }
}
