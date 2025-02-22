import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myl_membership/provider/provider.dart';
import 'package:myl_membership/provider/search_provider.dart';
import 'package:provider/provider.dart';
import 'councillor.dart';
import '../model/model.dart';

class AddCouncilorScreen extends StatelessWidget {
  const AddCouncilorScreen({super.key});

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
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/image2/app_bar_back.png"),
          onPressed: () {
            searchProvider.resetSearchQuery(); // Reset search query on back
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CouncilorsScreen()),
            );
          },
        ),
        title: Text(
          'Add Councilor',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: screenHeight * 0.07,
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
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: filteredCouncilors.length,
                itemBuilder: (context, index) {
                  return CouncilorCard(councilor: filteredCouncilors[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CouncilorCard extends StatelessWidget {
  final Councilor councilor;

  const CouncilorCard({super.key, required this.councilor});

  @override
  Widget build(BuildContext context) {
    final councilorProvider = Provider.of<CouncilorProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;

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
                  backgroundImage: AssetImage("assets/image2/Frame 154.png"),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      councilor.name,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      councilor.phone,
                      style: GoogleFonts.poppins(
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
                Radio<int>(
                  value: councilorProvider.councilors.indexOf(councilor),
                  fillColor: WidgetStateColor.resolveWith(
                    (states) =>
                        states.contains(WidgetState.selected)
                            ? Colors
                                .black // Fill color when selected
                            : Colors.grey,
                  ), // Color when not selected
                  groupValue: councilorProvider.selectedIndex,
                  onChanged: (value) {
                    if (value != null) {
                      _showConfirmationDialog(
                        context,
                        councilor,
                        value,
                        councilorProvider,
                      );
                      councilorProvider.selectCouncilor(value);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildTag("Age", "26"),
                const SizedBox(width: 55),
                buildTag("Blood", "AB +ve"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildInfoText(String text, {bool isBold = false, bool isGrey = false}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
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
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}

void _showConfirmationDialog(
  BuildContext context,
  Councilor councilor,
  int index,
  CouncilorProvider councilorProvider,
) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Optional rounded corners
        ),
        child: SizedBox(
          width: 396, // Fixed width
          child: Padding(
            padding: EdgeInsets.all(16), // Adjust padding if needed
            child: Column(
              mainAxisSize: MainAxisSize.min, // Hug content height
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/image2/Icone_!.png",
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Confirm the Member",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(councilor.image),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          councilor.name,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          councilor.phone,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff06573F)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xff06573F),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _showSuccessDialog(
                          context,
                          councilor,
                          councilorProvider,
                        );
                        councilorProvider.selectCouncilor(index);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
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
                        child: Text(
                          "OK",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _showSuccessDialog(
  BuildContext context,
  Councilor councilor,
  CouncilorProvider councilorProvider,
) {
  final searchProvider = Provider.of<SearchProvider>(context, listen: false);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      Future.delayed(Duration(seconds: 2), () {
        searchProvider.resetSearchQuery();
        Navigator.of(context).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CouncilorsScreen()),
        );
      });

      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/image2/confirm_tick.png", scale: 4),
            SizedBox(height: 10),
            Text(
              "Councilor Added",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(councilor.image),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      councilor.name,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      councilor.phone,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
