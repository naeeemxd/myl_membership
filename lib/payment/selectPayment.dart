import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myl_membership/payment/paymentFaield.dart';
import 'package:myl_membership/payment/pymentSuccess.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: AppBar(
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
              'Payment',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: const Text(
                'Select Payment Method',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
            PaymentMethodTile(
              icon: Image.asset('assets/images/payment_images/paytm.png'),
              title: 'Paytm',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSuccessScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            PaymentMethodTile(
              icon: Image.asset('assets/images/payment_images/gpay.png'),
              title: 'Google Pay',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentFailureScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            PaymentMethodTile(
              icon: Image.asset('assets/images/payment_images/bank.png'),
              title: 'Net Banking',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            PaymentMethodTile(
              icon: Image.asset('assets/images/payment_images/debit.png'),
              title: 'Credit / Debit Card',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
        side: BorderSide(color: Colors.grey, width: 0.5), // Border
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      leading: SizedBox(width: 40, height: 40, child: icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black),
      onTap: onTap,
    );
  }
}
