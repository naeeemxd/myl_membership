import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MaterialApp(home: CertificateCard()));

class CertificateCard extends StatelessWidget {
  const CertificateCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final certificateHeight =
        isTablet ? screenHeight * 0.6 : screenHeight * 0.3;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // Navigate back to the previous screen
            Navigator.of(context).pop();
          },
          child: Transform.scale(
            scale: 0.5, // Adjust the scale factor as needed
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white30,
              ),
              child: SvgPicture.asset(
                "assets/logo/back_arrow.svg",
                color: Colors.white,
              ),
            ),
          ),
        ),

        backgroundColor: Colors.black,
        title: const Text(
          'Affiliate Certificate',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(color: Colors.grey, thickness: 0.3),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: certificateHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFECDAAF),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFECDAAF),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/cirtfctbg.png'),
                          fit: BoxFit.contain,
                        ),
                        border: Border.all(
                          color: const Color(0xFF9E7A3C),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Affiliate Certificate',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Container(
                              height: 1,
                              width: 100,
                              color: const Color(0xFF9E7A3C),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                            ),
                            const SizedBox(height: 10),
                            // Logo
                            Container(
                              width: 36,
                              height: 36,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF02786E),
                                    Color(0xFF62BE40),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset("assets/images/logo4x.png"),
                              ),
                            ),
                            const SizedBox(height: 30),
                            _buildInfoRow('District', 'Malappuram'),
                            _buildInfoRow('Panchayath', 'Vengara'),
                            _buildInfoRow('Unit', 'Vengara Unit'),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: SvgPicture.asset(
                                      'assets/logo/Vector1.svg',
                                      width: 15,
                                      height: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Secretory',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
