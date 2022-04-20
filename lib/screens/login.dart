import 'package:flutter/material.dart';
import 'package:test_app/main.dart';
import 'package:test_app/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final usernameCtrl = TextEditingController();

  final passctrl = TextEditingController();
  bool isDataMatched = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                    controller: usernameCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                    validator: (value) {
                      // if (isDataMatched) {
                      //     return null;
                      //   } else {
                      //     return 'error';
                      //   }

                      if (value == null || value.isEmpty) {
                        return 'value is empty';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: passctrl,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password ',
                    ),
                    validator: (value) {
                      // if (isDataMatched) {
                      //   return null;
                      // } else {
                      //   return 'error';
                      // }

                      if (value == null || value.isEmpty) {
                        return 'value is empty';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !isDataMatched,
                      child: Text(
                        'Username and Password is error',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          login(context);
                        } else {
                          print('data empty');
                        }
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login(BuildContext context) async {
    final username = usernameCtrl.text;
    final password = passctrl.text;

    if (username == password) {
      print('matched');

      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));
    } else {
      print('not match');
    }
  }
}
