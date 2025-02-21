import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myl_membership/cirtificate.dart';

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
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme, // Merge with the existing text theme
        ).apply(
          bodyColor: Colors.black, // Set default text color
          displayColor:
              Colors.black, // Set display text color (headlines, etc.)
        ),
      ),
      home: const CommitteePage(),
    );
  }
}

class CommitteePage extends StatelessWidget {
  const CommitteePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/images/logo4x.png"),
          onPressed: () {},
        ),
        title: Text(
          'Add Councilor',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildAffiliateCertificateButton(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'President',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Divider(),
                  const SizedBox(height: 12),
                  _buildMemberCard(
                    'Ameen',
                    'Malappuram',
                    'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                  ),
                  const Text(
                    'General Secretary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Divider(),
                  const SizedBox(height: 12),
                  _buildMemberCard(
                    'Ameen',
                    'Malappuram',
                    'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                  ),
                  const Text(
                    'Vice President',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Divider(),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildMemberCard(
                        'Ameen',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                      _buildMemberCard(
                        'Yaser',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Secretary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Divider(),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildMemberCard(
                        'Nahid Azad',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                      _buildMemberCard(
                        'Shafiq',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Executive Members',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        color: Colors.green,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Divider(),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16.0, // Horizontal space
                    runSpacing: 12.0, // Vertical space
                    children: [
                      _buildMemberCard(
                        'Fazil ',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                      _buildMemberCard(
                        'Asif',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                      _buildMemberCard(
                        'Yakoob',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                      _buildMemberCard(
                        'Fazil ',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                      _buildMemberCard(
                        'Asif',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                      _buildMemberCard(
                        'Yakoob',
                        'Malappuram',
                        'https://tse2.mm.bing.net/th?id=OIP.ca7V0f3w55L-EOAqZqAFhAHaE8&pid=Api&P=0&h=220',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAffiliateCertificateButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF033123), Color(0xFF098D65)],
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListTile(
        leading: SvgPicture.asset("assets/logo/tick.svg"),
        title: const Text(
          'Affiliate Certificate',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CertificateCard()),
          );
        },
      ),
    );
  }

  Widget _buildMemberCard(String name, String location, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 83,
              width: 83,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(
            location,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
