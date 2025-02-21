import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 2,
        shadowColor: Colors.white70,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/logo/back_arrow.svg",
            width: 25,
            height: 25,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Payment Status',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                // color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Lottie.asset(
                "assets/animation/Animation - 1740134450194.json",
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Payment Success!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We have received your payment.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Text(
              'Thankyou',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
