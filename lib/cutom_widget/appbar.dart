import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MainAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Transform.translate(
        offset: const Offset(12, 0), // Moves right by 10 pixels
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF02786E), Color(0xFF62BE40)],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              "assets/images/logo4x.png",
              height: 35,
              width: 35,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80); // Correct way to set AppBar height
}

class PaymentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PaymentAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          backgroundColor: const Color(0xFFFFFFFF),
          elevation: 2,
          shadowColor: Colors.white70,
          leading: IconButton(
            icon: Container(
              height: 32,
              width: 32,

              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0, top: 4, bottom: 4),
                child: SvgPicture.asset("assets/logo/back_arrow.svg"),
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

class CustomAppBarPayment extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomAppBarPayment({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          backgroundColor: const Color(0xFFFFFFFF),
          elevation: 2,
          shadowColor: Colors.white70,
          automaticallyImplyLeading: false, // Removes default back button
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
