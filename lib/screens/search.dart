import 'package:flutter/material.dart';
import 'package:test_app/db/functions/db_functions.dart';
import 'package:test_app/screens/widget/add_student_widget.dart';
import 'package:test_app/screens/widget/list_student_widget.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudentWidget(),
          const Expanded(child: ListStudentWidget()),
        ],
      )),
    );
  }
}
