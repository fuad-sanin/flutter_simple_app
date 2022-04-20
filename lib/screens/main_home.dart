import 'package:flutter/material.dart';

class main_home extends StatelessWidget {
   main_home({ Key? key }) : super(key: key);


  final _list = [
    'Apple',
    'Samsung',
    'xiaomi'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: DropdownButtonFormField(
        onChanged: (value){
          print(value);
        },
        items: _list.map((e) {
        return DropdownMenuItem(
        value: e,
        child: Text(e),);
      }).toList()),),
     
    );
  }
}