import 'package:flutter/material.dart';
import 'package:hino/utils/routes.dart';
import 'package:hino/widgets/appBar.dart';
import '../widgets/appBar.dart';

class Registration extends StatefulWidget {
  static String routeName = './Registration';
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formkey = GlobalKey<FormState>();
  bool changeButton = false;

  moveTologin(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Registered Sucessfully'),
        duration: const Duration(seconds: 4),
      ));
      await Future.delayed(Duration(seconds: 1));
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
        appBar: CustomAppBar(text: 'Resgistration'),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
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
                            hintText: "Enter email",
                            labelText: "Email",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            } else if (!value.contains('@')) {
                              return 'Please enter an valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Please enter Full Name",
                            labelText: "Fullname",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Fullname cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          maxLength: 6,
                          obscureText: true,
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
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Please enter phone number",
                            labelText: "Phone number",
                          ),
                          maxLength: 11,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone number cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Please enter Chassis",
                            labelText: "Chassis number",
                          ),
                          maxLength: 17,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Chassis number cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(16)),
                          child: MaterialButton(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => moveTologin(context),
                          ),
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
