import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Councilor {
  final String name;
  final String phone;
  final String district;
  final String panchayath;
  final String unit;
  final String age;
  final String bloodGroup;
  final String image;

  Councilor({
    required this.name,
    required this.phone,
    required this.district,
    required this.panchayath,
    required this.unit,
    required this.age,
    required this.bloodGroup,
    required this.image,
  });
}

class AddExecutive extends StatefulWidget {
  const AddExecutive({super.key});

  @override
  State<AddExecutive> createState() => _AddExecutiveState();
}

class _AddExecutiveState extends State<AddExecutive> {
  // Dummy data
  final List<Councilor> councilors = [
    Councilor(
      name: "John Doe",
      phone: "+91 9876543210",
      district: "Ernakulam",
      panchayath: "Aluva",
      unit: "Unit A",
      age: "26",
      bloodGroup: "AB +ve",
      image: "assets/image2/Frame 154.png",
    ),
    Councilor(
      name: "Jane Smith",
      phone: "+91 9876543211",
      district: "Thrissur",
      panchayath: "Chalakudy",
      unit: "Unit B",
      age: "32",
      bloodGroup: "O +ve",
      image: "assets/image2/Frame 154.png",
    ),
    Councilor(
      name: "Mike Johnson",
      phone: "+91 9876543212",
      district: "Kozhikode",
      panchayath: "Vadakara",
      unit: "Unit C",
      age: "29",
      bloodGroup: "A +ve",
      image: "assets/image2/Frame 154.png",
    ),
  ];

  String searchQuery = '';
  int? selectedIndex;

  List<Councilor> get filteredCouncilors {
    if (searchQuery.isEmpty) return councilors;
    return councilors.where((councilor) {
      return councilor.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          councilor.district.toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          councilor.panchayath.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/image2/app_bar_back.png"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Executive Member',
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: TextField(
                cursorHeight: 25,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: 'Search Members',
                  hintStyle: TextStyle(
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
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: filteredCouncilors.length,
                itemBuilder: (context, index) {
                  return CouncilorCard(
                    councilor: filteredCouncilors[index],
                    isSelected: selectedIndex == index,
                    onSelect: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      _showConfirmationDialog(
                        context,
                        filteredCouncilors[index],
                        index,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(
    BuildContext context,
    Councilor councilor,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: 396,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Image.asset(
                          "assets/image2/Icone_!.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        // Ensures text wraps properly
                        child: Text(
                          "Confirm the Executive Member",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true, // Allow wrapping
                          overflow: TextOverflow.clip, // Prevent overflow
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
                              fontSize: 20,
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
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
                          Navigator.pop(context);
                          _showSuccessDialog(context, councilor);
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

  void _showSuccessDialog(BuildContext context, Councilor councilor) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
          Navigator.pop(context);
        });

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
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
}

class CouncilorCard extends StatelessWidget {
  final Councilor councilor;
  final bool isSelected;
  final VoidCallback onSelect;

  const CouncilorCard({
    super.key,
    required this.councilor,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: screenWidth > 400 ? 350 : screenWidth * 0.9,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
                Radio<bool>(
                  value: true,
                  groupValue: isSelected,
                  onChanged: (_) => onSelect(),
                  fillColor: MaterialStateColor.resolveWith(
                    (states) =>
                        states.contains(MaterialState.selected)
                            ? Colors.black
                            : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildTag("Age", councilor.age),
                const SizedBox(width: 55),
                buildTag("Blood", councilor.bloodGroup),
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
