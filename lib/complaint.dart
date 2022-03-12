import 'package:flutter/material.dart';
import 'package:hino/utils/routes.dart';
import 'package:hino/widgets/appBar.dart';
import '../widgets/appBar.dart';

class Complaint extends StatefulWidget {
  static String routeName = './Complaints';
  @override
  State<Complaint> createState() => _RegistrationState();
}

class _RegistrationState extends State<Complaint> {
  String dropdownValue = 'Sindh';
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
        appBar: CustomAppBar(text: 'Complain'),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Select your region'),
                            Container(
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Sindh',
                                  'Punjab',
                                  'Balochistan',
                                  'Kpk',
                                  'NWFP'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Select your Complain type'),
                            Container(
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Sindh',
                                  'Punjab',
                                  'Balochistan',
                                  'Kpk',
                                  'NWFP'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          maxLength: 500,
                          maxLines: 6,
                          minLines: 5,
                          decoration: InputDecoration(
                            hintText: "Describe your Complain",
                            labelText: "Complain",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Description cannot be empty";
                            } else if (value.length < 12) {
                              return 'Description length shoulb be atleast 12';
                            }
                            return null;
                          },
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
                                'Complain',
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
