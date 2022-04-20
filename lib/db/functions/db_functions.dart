import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentlistNotifier = ValueNotifier([]);

void addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(value);
  value.id = _id;  
  studentlistNotifier.value.add(value);
  studentlistNotifier.notifyListeners();
}

Future getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>("student_db");
  studentlistNotifier.value.clear();

  studentlistNotifier.value.addAll(studentDB.values);
  studentlistNotifier.notifyListeners();
}
Future deleteStudents(int id)async{
final studentDB = await Hive.openBox<StudentModel>("student_db");
await studentDB.delete(id);
getAllStudents();
}
