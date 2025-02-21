import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  final List<Map<String, String>> members = [
    {
      "name": "Asif",
      "phoneNumber": "8086 123 655",
      "district": "Malappuram",
      "panchayath": "Oorakam",
      "unit": "Oorakam Unit",
      "age": "26",
      "bloodGroup": "AB+ve",
      "status": "Unpaid",
    },
    {
      "name": "Noushad",
      "phoneNumber": "8086 123 655",
      "district": "Kozhikode",
      "panchayath": "Kappad",
      "unit": "Kappad Unit",
      "age": "30",
      "bloodGroup": "O+ve",
      "status": "Registered",
    },
    {
      "name": "Ameen",
      "phoneNumber": "8086 123 655",
      "district": "Kannur",
      "panchayath": "Thalassery",
      "unit": "Thalassery Unit",
      "age": "24",
      "bloodGroup": "B-ve",
      "status": "Unpaid",
    },
    {
      "name": "Haseeb",
      "phoneNumber": "8086 123 655",
      "district": "Thrissur",
      "panchayath": "Irinjalakuda",
      "unit": "Irinjalakuda Unit",
      "age": "29",
      "bloodGroup": "A+ve",
      "status": "Registered",
    },
    {
      "name": "Ameen",
      "phoneNumber": "8086 123 655",
      "district": "Palakkad",
      "panchayath": "Mannarkkad",
      "unit": "Mannarkkad Unit",
      "age": "28",
      "bloodGroup": "O+ve",
      "status": "Registered",
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, String>> filteredMembers =
        members
            .where(
              (member) =>
                  member["name"]!.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ||
                  member["phoneNumber"]!.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ),
            )
            .toList();

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
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
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
                      onPressed: () {
                        // Placeholder for Register button action
                      },
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
            const SizedBox(height: 10),
            // Members List
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredMembers.length,
              itemBuilder: (context, index) {
                final member = filteredMembers[index];
                return ProfileCard(
                  name: member["name"]!,
                  phoneNumber: member["phoneNumber"]!,
                  district: member["district"]!,
                  panchayath: member["panchayath"]!,
                  unit: member["unit"]!,
                  age: member["age"]!,
                  bloodGroup: member["bloodGroup"]!,
                  imageUrl: 'https://picsum.photos/50/50?random=$index',
                  status: member["status"]!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
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
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)],
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
              ],
            ),
          ],
        ),
      ),
    );
  }

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
