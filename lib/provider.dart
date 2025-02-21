import 'package:flutter/material.dart';
import 'package:myl_membership/model.dart';

class CommitteeProvider with ChangeNotifier {
  List<CommitteeMember> _members = [];

  List<CommitteeMember> get members => _members;

  // Simulate fetching data from a database
  Future<void> fetchMembers() async {
    // Simulate a delay (e.g., fetching from a database)
    await Future.delayed(const Duration(seconds: 2));

    // Hardcoded data for demonstration
    _members = [
      CommitteeMember(
        name: 'Muhammed Noushad',
        location: 'Malappuram',
        imageUrl: 'https://example.com/president.png', // Replace with actual URL
      ),
      CommitteeMember(
        name: 'Muhammed Sinan',
        location: 'Malappuram',
        imageUrl: 'https://example.com/secretary.png', // Replace with actual URL
      ),
      CommitteeMember(
        name: 'Ameen',
        location: 'Malappuram',
        imageUrl: null, // No image URL
      ),
      CommitteeMember(
        name: 'Yaser',
        location: 'Malappuram',
        imageUrl: 'https://example.com/yaser.png', // Replace with actual URL
      ),
    ];

    notifyListeners();
  }
}