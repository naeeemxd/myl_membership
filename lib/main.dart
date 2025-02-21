import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myl_membership/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme, // Merge with the existing text theme
        ).apply(
          bodyColor: Colors.black, // Set default text color
          displayColor:
              Colors.black, // Set display text color (headlines, etc.)
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
