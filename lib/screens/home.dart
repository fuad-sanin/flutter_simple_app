import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/screens/account.dart';
import 'package:test_app/screens/gift.dart';
import 'package:test_app/screens/login.dart';
import 'package:test_app/screens/main_home.dart';
import 'package:test_app/screens/search.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int cur_sel_index = 0;

  final _pages = [
    main_home(),
    search(),
    gifts(),
    account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[cur_sel_index],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_up_rounded),
        onPressed: () {
          showBottomSheet(context);
        },
        tooltip: 'increment',
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cur_sel_index,
        onTap: (newIndex) {
          setState(() {
            cur_sel_index = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Gift'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      appBar: AppBar(
        title: Text('HOME'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
    
      ),
      
      
    );
  }
}

signout(BuildContext ctx) async {
  final _sharedprefs = await SharedPreferences.getInstance();
  await _sharedprefs.clear();
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
}

Future showBottomSheet(BuildContext ctx) async {
  showModalBottomSheet(
      context: ctx,
      builder: (ctx1) {
        return Container(
          width: double.infinity,
          height: 500,
          color: Colors.blue,
          child: ListView(
            children: [
              Center(child: Text('WELCOME')),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx1).pop();
                      },
                      child: Text('close'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
