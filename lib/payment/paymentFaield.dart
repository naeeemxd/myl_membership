import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentFailureScreen extends StatelessWidget {
  const PaymentFailureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFFE83C3C),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "https://s3-alpha-sig.figma.com/img/f494/5f88/b38d6fc56280675d81d052c74e5b44d9?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=k~U76xt4JvLaN8CrNip5y~FpozK2aILnRyOBwJVArKFk7OnV13RPj-w8-4am7AeJSMKGiz3hr0eck3InimEH6AnQRBw6r5ZvunubPKFJl4w8aiPIgr68rJcz3htiLknhg5UffgEkbmkxaIBhPyZs31xwrI2yLYmyqc56KMjsbMQsnZWKCPQxKZJksy8JsyJOqyoLRH3k4dakCHPZmW8ceNsh0GLQQJvLUCMqbfrpnpgve78FuoTpdLHVGjrJxCPUlnffkaUz-ix9PKOPFwQuaAJuESJjM1F8VnkjRJvK8dydxTeLL4YfHAFI1aB4JX8uB8ShCvCXhE0cjxBtmXxFlQ__",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment Failed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Something went wrong. We couldn\'t process your payment. Contact our support if you have lost money.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Add support action here
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    side: const BorderSide(color: Color(0xFFFF3B30)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Support',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Add retry action here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    backgroundColor: const Color(0xFFFF3B30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Try Again',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
