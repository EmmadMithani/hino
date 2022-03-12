import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hino/complaint.dart';
import 'package:hino/forget_password_screen.dart';
import 'package:hino/registration.dart';
import 'package:hino/utils/routes.dart';
import 'package:hino/login_page.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
            titleTextStyle: Theme.of(context).textTheme.headline6,
          )),
      // darkTheme: ThemeData(brightness: Brightness.light),
      routes: {
        '/': (context) => LoginPage(),
        Registration.routeName: (context) => Registration(),
        Complaint.routeName: (ctx) => Complaint(),
        LoginPage.routeName: (ctx) => LoginPage(),
        ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
      },
    );
  }
}
