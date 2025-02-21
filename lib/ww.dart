import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Members',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: Row(
                children: [
                  Container(
                    width: screenWidth / 2 + 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12, // Shadow color
                          blurRadius: 6, // Blur radius
                          offset: Offset(0, 3), // Shadow offset (x, y)
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset("assets/logo/search-01.svg"),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF033123), Color(0xFF098D65)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("assets/logo/plus.svg"),
                          const SizedBox(width: 5),
                          const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //registerd
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 18),
              child: Row(
                children: [
                  Container(
                    height: 57,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF033123), Color(0xFF098D65)],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "All",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 4),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Text(
                              "236",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 57,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // Shadow color
                          blurRadius: 6, // Blur radius
                          offset: Offset(
                            0,
                            3,
                          ), // Shadow offset (horizontal, vertical)
                        ),
                      ],
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Registerd",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey,
                            child: Text(
                              "236",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // unpaid Row
                  SizedBox(width: 15),
                  Container(
                    height: 57,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // Shadow color
                          blurRadius: 6, // Blur radius
                          offset: Offset(
                            0,
                            3,
                          ), // Shadow offset (horizontal, vertical)
                        ),
                      ],
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Unpaid",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 4),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey,
                            child: Text(
                              "236",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Members List
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProfileCard(
                  name: ['Asif', 'Noushad', 'Ameen', 'Haseeb', 'Ameen'][index],
                  phoneNumber: '8086 123 655',
                  district: 'Malappuram',
                  panchayath: 'Oorakam',
                  unit: 'Oorakam Unit',
                  age: '26',
                  bloodGroup: 'AB+ve',
                  imageUrl: 'https://picsum.photos/50/50?random=$index',
                  status: index % 2 == 0 ? 'Unpaid' : 'Registered',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //all registred unpaid
  //   Widget _buildStat(String label, String count, {bool isRed = false}) {
  //     return Container(
  //       width: screenwidth,
  //       height: 45,
  //       decoration: BoxDecoration(),
  //       child: ElevatedButton(
  //         onPressed: () {},
  //         child: Row(
  //           children: [
  //             Text(label, style: const TextStyle(fontSize: 14)),
  //             const SizedBox(width: 4),
  //             Text(
  //               count,
  //               style: TextStyle(
  //                 fontSize: 12,
  //                 color: isRed ? Colors.red : Colors.black,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String district;
  final String panchayath;
  final String unit;
  final String age;
  final String bloodGroup;
  final String imageUrl;
  final String status;

  const ProfileCard({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.district,
    required this.panchayath,
    required this.unit,
    required this.age,
    required this.bloodGroup,
    required this.imageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: screenWidth > 400 ? 350 : screenWidth * 0.9,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Shadow color
              blurRadius: 3, // Blur radius
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      phoneNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  status,
                  style: TextStyle(
                    color:
                        status == 'Unpaid' ? Colors.red : Colors.green.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoText("District"),
                    buildInfoText("Panchayath"),
                    buildInfoText("Unit"),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoText(district, isBold: true),
                    buildInfoText(panchayath, isBold: true),
                    buildInfoText(unit, isBold: true),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                buildTag("Age", age),
                const SizedBox(width: 55),
                buildTag("Blood", bloodGroup),
                // const Spacer(),
                // Text(
                //   status,
                //   style: TextStyle(
                //     color:
                //         status == 'Unpaid' ? Colors.red : Colors.green.shade900,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //district, panchayath etc..
  Widget buildInfoText(String text, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: Colors.black87,
        ),
      ),
    );
  }

  //age & blood
  Widget buildTag(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            "$label ",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
