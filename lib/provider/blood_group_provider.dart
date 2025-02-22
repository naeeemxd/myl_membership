import 'package:flutter/material.dart';

class BloodGroupProvider extends ChangeNotifier {
  String? _selectedBloodGroup;
  final TextEditingController textController = TextEditingController();

  String? get selectedBloodGroup => _selectedBloodGroup;

  void setBloodGroup(String bloodGroup) {
    _selectedBloodGroup = bloodGroup;
    textController.text = bloodGroup; // Update TextField text
    notifyListeners();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
