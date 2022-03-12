import 'package:flutter/material.dart';
import 'package:hino/forget_password_screen.dart';
import 'package:hino/utils/routes.dart';
import 'package:hino/widgets/appBar.dart';
import '../widgets/appBar.dart';
import 'registration.dart';

class LoginPage extends StatefulWidget {
  static String routeName = './Login';

  @override
  State<LoginPage> createState() => _RegistrationState();
}

class _RegistrationState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  bool changeButton = false;

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      Navigator.pushNamed(context, MyRoutes.loginRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: CustomAppBar(text: 'Login'),
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
                        SizedBox(height: 15),
                        TextFormField(
                          maxLength: 6,
                          decoration: InputDecoration(
                            hintText: "Please enter Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return 'Password length shoulb be atleast 6';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Registration.routeName);
                              },
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ForgetPasswordScreen.routeName);
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(16)),
                          child: MaterialButton(
                              child: Text(
                                'LOGIN',
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
      ),
    );
  }
}
