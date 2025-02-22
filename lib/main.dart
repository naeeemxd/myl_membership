import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myl_membership/provider/Executive_Provider.dart';
import 'package:myl_membership/provider/blood_group_provider.dart';
import 'package:myl_membership/provider/memberregstrn_provider.dart';
import 'package:myl_membership/provider/membrsScreen_provider.dart';
import 'package:myl_membership/provider/provider.dart';
import 'package:myl_membership/provider/search_provider.dart';
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
        ChangeNotifierProvider(create: (_) => BloodGroupProvider()),
        ChangeNotifierProvider(create: (_) => MemberRegistrationProvider()),
        ChangeNotifierProvider(create: (_) => CouncilorProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => MembersProvider()),
        ChangeNotifierProvider(create: (_) => ExecutiveProvider()),
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
