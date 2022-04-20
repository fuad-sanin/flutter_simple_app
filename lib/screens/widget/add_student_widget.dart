import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/db/functions/db_functions.dart';
import 'package:test_app/db/model/data_model.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'name',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _ageController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'age',
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
            onPressed: () {
              studentbuttonclicked();
            },
            icon: const Icon(Icons.add),
            label: const Text('add student'))
      ]),
    );
  }

  Future studentbuttonclicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    print('$_name $_age');

    final _student = StudentModel(name: _name, age: _age);
    addStudent(_student);
  }
}
