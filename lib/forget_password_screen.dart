import 'package:flutter/material.dart';

import 'widgets/appBar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String routeName = './ForgetPasswordScreen';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Forget Password'),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Image.asset(
                  "assets/images/hino.jpeg",
                  height: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Please enter email",
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email can not be empty";
                          } else if (!value.contains('@')) {
                            return 'Please enter an valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(16)),
                        child: MaterialButton(
                            child: Text(
                              'Reset password',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {}),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
