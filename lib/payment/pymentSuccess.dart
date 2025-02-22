import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:myl_membership/cutom_widget/appbar.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarPayment(title: "Payment Status"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                50,
              ), // Adjust for rounded shape
              child: Lottie.asset(
                "assets/animation/paymentsuccesful.mp4.lottie.json",
                repeat: false,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
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
