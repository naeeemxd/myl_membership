

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              child: FutureBuilder(
                future: Future.delayed(
                  Duration(seconds: 1),
                ), // Delay of 2 seconds
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Image.network(
                      "https://s3-alpha-sig.figma.com/img/2b19/5925/79f9121061e4b91795809499eed1673b?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mPUaI4mKt397XBalniHiq9XIDGHVOoIy7DKi-ycV6OZ6TctRTTATFVQaLGC~3ZWOKNrc9RowaawuZJAqfE9neWuL4kti3e6ufrHaP3njITem88Wcyq4Ubb56WZaoDdVEC17uyNj4HYFVsX7moTtUhNkrsy1D30EbLyGqSjGGW4i3-S5GLNT7d3BX8HpA8AX8b0qVQNfaPxER8vK9u8P6Ec4UVyp-lGcbTdSfvaHOiZlG5r0GJOEODfkKXN94ua6JhazB81V51c8rTNXenMdDbFdAneQtmWtbwc19E5BBI3jZ6EELCehnfL55ecrsbZSBZQMVH1AQyulxPOvUXa6t0g__",
                      fit: BoxFit.cover,
                    );
                  } else {
                    return CircularProgressIndicator(); // Show loading indicator while waiting
                  }
                },
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
