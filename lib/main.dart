import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myl_membership/provider/blood_group_provider.dart';
import 'package:provider/provider.dart';
import 'package:myl_membership/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BloodGroupProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MYL Membership', // Add a title for better app identification
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.green,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ).apply(bodyColor: Colors.black, displayColor: Colors.black),
        ),
        home: const LoginScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          // Add more routes if needed
        },
      ),
    );
  }
}
