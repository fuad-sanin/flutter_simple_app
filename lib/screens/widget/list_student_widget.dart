import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/db/functions/db_functions.dart';
import 'package:test_app/db/model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentlistNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentlist, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentlist[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(
                onPressed: () {
                  if (data.id != null) {
                    deleteStudents(data.id!);
                  } else {
                    print('sorry unable to delete');
                  }
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentlist.length,
        );
      },
    );
  }
}
