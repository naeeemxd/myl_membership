import 'package:flutter/material.dart';
import 'package:myl_membership/cutom_widget/appbar.dart';
import 'package:myl_membership/Members/membrreg.dart';

class Voterid extends StatelessWidget {
  const Voterid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PaymentAppBar(title: "Member Registration"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            TextField(
              // controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Enter Voter Id Number',
                labelStyle: TextStyle(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(94),
                gradient: const LinearGradient(
                  colors: [Color(0xFF033123), Color(0xFF098D65)],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemberRegistration(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
