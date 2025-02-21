
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MemberRegistration()));
}

class MemberRegistration extends StatefulWidget {
  const MemberRegistration({super.key});

  @override
  _MemberRegistrationState createState() => _MemberRegistrationState();
}

class _MemberRegistrationState extends State<MemberRegistration> {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    if (pickedDate != null) {
      // Format selected date
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

      // Calculate age
      int age = currentDate.year - pickedDate.year;
      if (currentDate.month < pickedDate.month ||
          (currentDate.month == pickedDate.month &&
              currentDate.day < pickedDate.day)) {
        age--;
      }

      // Update controllers
      setState(() {
        _dobController.text = formattedDate;
        _ageController.text = age.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Member Registration',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DOB Field with Date Picker
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    labelText: 'DOB',
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Age Field (Read-only)
            TextField(
              controller: _ageController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(color: Colors.grey[600]),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
