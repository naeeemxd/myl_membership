import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myl_membership/provider/provider.dart';
import 'package:myl_membership/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'add_counciilor.dart';
import '../../model/model.dart';

class CouncilorsScreen extends StatelessWidget {
  const CouncilorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final councilorProvider = Provider.of<CouncilorProvider>(context);
    final searchProvider = Provider.of<SearchProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final filteredCouncilors = searchProvider.getFilteredCouncilors(
      councilorProvider.councilors,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/image2/myl_appbar_logo.png", height: 40),
              Text(
                "Councilors",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: screenWidth * 0.1),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 10),
            InfoCard(),
            SizedBox(height: 10),
            GenderCountRow(),
            SizedBox(height: 10),
            Container(
              height: screenHeight * 0.06,
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the TextField
                borderRadius: BorderRadius.circular(50), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 0), // Shadow position (X, Y)
                  ),
                ],
              ),
              child: TextField(
                cursorHeight: 25,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: 'Search Councilors',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9A9A9A),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/image2/search_icon.png",
                      scale: 4,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  searchProvider.updateSearchQuery(value);
                },
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCouncilors.length,
                physics: BouncingScrollPhysics(),
                itemBuilder:
                    (context, index) =>
                        ProfileCard(councilor: filteredCouncilors[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth > 400 ? 350 : screenWidth * 0.9;

    return Container(
      width: screenWidth > 400 ? 350 : screenWidth * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF9EFFE1), Color(0xFFD3FFF1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoBlock("Members", "200"),
          Container(height: 40, width: 2, color: Colors.black54),
          _buildInfoBlock("Councilors Slot", "5"),
        ],
      ),
    );
  }

  Widget _buildInfoBlock(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xff91F6D7),
            shape: BoxShape.circle,
          ),
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class GenderCountRow extends StatelessWidget {
  const GenderCountRow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final searchProvider = Provider.of<SearchProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _genderCard("Male", "2", screenWidth * 0.2),
        _genderCard("Female", "2", screenWidth * 0.25),
        InkWell(
          onTap: () {
            searchProvider
                .resetSearchQuery(); // Reset search query on navigation
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCouncilorScreen()),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF032B1F),
                  Color(0xFF065A40),
                  Color(0xFF0A9168),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.add_circled, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  "Add Councilor",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _genderCard(String title, String value, double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: Color(0xFF087D59), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Councilor councilor;

  const ProfileCard({super.key, required this.councilor});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth > 400 ? 350 : screenWidth * 0.9;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: screenWidth > 400 ? 350 : screenWidth * 0.9,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black26),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(councilor.image),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      councilor.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      councilor.phone,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoText("District", isGrey: true),
                    buildInfoText("Panchayath", isGrey: true),
                    buildInfoText("Unit", isGrey: true),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoText(councilor.district, isBold: true),
                    buildInfoText(councilor.panchayath, isBold: true),
                    buildInfoText(councilor.unit, isBold: true),
                  ],
                ),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                buildTag("Age", councilor.age),
                const SizedBox(width: 80),
                buildTag("Blood", councilor.blood),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoText(
    String text, {
    bool isBold = false,
    bool isGrey = false,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: isGrey ? Color(0xff606060) : Colors.black,
      ),
    );
  }

  Widget buildTag(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            "$label ",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
