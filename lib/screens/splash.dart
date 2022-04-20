import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/main.dart';
import 'package:test_app/screens/home.dart';
import 'package:test_app/screens/login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checklogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 300,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => ScreenLogin()),
    );
  }

  Future checklogin() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx1  ) => ScreenHome()),
      );
    }
  }
}
