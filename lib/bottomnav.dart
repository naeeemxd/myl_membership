import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myl_membership/committee.dart';
import 'package:myl_membership/councillor.dart';
import 'package:myl_membership/membersscrn.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    MembersScreen(),
    CouncilorsScreen(),
    CommitteePage(),
  ];

  Widget _buildNavItem(String iconPath, String label, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          color: _selectedIndex == index ? Colors.blue : Colors.black,
          height: 30,
          semanticsLabel: '$label Icon',
        ),
        if (_selectedIndex != index) SizedBox(height: 3),
        if (_selectedIndex != index)
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: _selectedIndex == index ? Colors.blue : Colors.black,
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
        animationCurve: Curves.easeOutQuad, // Reduced curve
        backgroundColor: Colors.transparent,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 75,
        index: _selectedIndex, // Set the current index
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
