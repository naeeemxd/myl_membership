import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myl_membership/committee.dart';
import 'package:myl_membership/councillor.dart';
import 'package:myl_membership/membersscrn.dart';

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
        primaryColor: Colors.green.shade800,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MembersScreen(),
    CouncilorsScreen(),
    CommitteePage(),
  ];

  Widget _buildNavItem(String iconPath, String label, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          color: _selectedIndex == index ? Colors.green.shade800 : Colors.black,
          height: 30,
          semanticsLabel: '$label Icon',
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color:
                _selectedIndex == index ? Colors.green.shade800 : Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeOutQuad,
        backgroundColor: Colors.transparent,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 75,
        index: _selectedIndex,
        items: <Widget>[
          _buildNavItem("assets/logo/members.svg", "Members", 0),
          _buildNavItem("assets/logo/councilers.svg", "Councilors", 1),
          _buildNavItem("assets/logo/committee2.svg", "Committee", 2),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
