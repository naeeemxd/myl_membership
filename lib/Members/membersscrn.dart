import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myl_membership/provider/membrsScreen_provider.dart';
import 'package:provider/provider.dart';
import 'package:myl_membership/cutom_widget/appbar.dart';
import 'package:myl_membership/Members/membrreg.dart';
import 'package:myl_membership/Members/voterid.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MembersProvider(),
      child: const MembersScreenContent(),
    );
  }
}

class MembersScreenContent extends StatelessWidget {
  const MembersScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final provider = Provider.of<MembersProvider>(context);

    return Scaffold(
      appBar: const MainAppBar(title: 'Members'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) => provider.updateSearchQuery(value),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Voterid(),
                          ),
                        );
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
            const StatusSection(),
            const SizedBox(height: 10),
            Consumer<MembersProvider>(
              builder:
                  (context, provider, _) => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.filteredMembers.length,
                    itemBuilder: (context, index) {
                      final member = provider.filteredMembers[index];
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
            ),
          ],
        ),
      ),
    );
  }
}

// Extracted Status Section Widget
class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 18),
      child: Row(
        children: [
          _buildStatusContainer(text: "All", count: "236", isGradient: true),
          const SizedBox(width: 15),
          _buildStatusContainer(
            text: "Registerd",
            count: "236",
            isGradient: false,
          ),
          const SizedBox(width: 15),
          _buildStatusContainer(
            text: "Unpaid",
            count: "236",
            isGradient: false,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusContainer({
    required String text,
    required String count,
    required bool isGradient,
  }) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        gradient:
            isGradient
                ? const LinearGradient(
                  colors: [Color(0xFF033123), Color(0xFF098D65)],
                )
                : null,
        color: isGradient ? null : Colors.white,
        boxShadow: [
          if (!isGradient)
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isGradient ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(width: 4),
            CircleAvatar(
              radius: 18,
              backgroundColor: isGradient ? Colors.white : Colors.grey[300],
              child: Text(
                count,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Keep ProfileCard as is since it's already stateless

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MemberRegistration()),
        );
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ), // Reduce vertical margin
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ), // Slightly smaller radius
        child: Container(
          width: screenWidth > 400 ? 350 : screenWidth * 0.9,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ), // Reduce padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2, // Slightly less blur
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Reduce unnecessary space
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25, // Reduce size
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  const SizedBox(
                    width: 12,
                  ), // Reduce space between avatar and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18, // Reduce font size slightly
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        phoneNumber,
                        style: const TextStyle(
                          fontSize: 13,
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
                          status == 'Unpaid'
                              ? Colors.red
                              : Colors.green.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 14, // Slightly smaller
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Reduce spacing
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
                  const SizedBox(width: 40), // Reduce spacing
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
              const SizedBox(height: 10), // Reduce spacing
              Row(
                children: [
                  buildTag("Age", age),
                  const SizedBox(width: 40), // Reduce spacing
                  buildTag("Blood", bloodGroup),
                ],
              ),
            ],
          ),
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
