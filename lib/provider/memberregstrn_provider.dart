import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MemberRegistrationProvider extends ChangeNotifier {
  final TextEditingController voterIdController = TextEditingController();
  final TextEditingController membershipController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController bloodController = TextEditingController();

  File? imageFile;
  final _picker = ImagePicker();

  final List<String> bloodGroups = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];

  String? selectedBloodGroup;

  void setBloodGroup(String bloodGroup) {
    selectedBloodGroup = bloodGroup;

    notifyListeners();
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageFile = File(image.path);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      throw Exception('Failed to pick image: $e');
    }
  }

  Future<void> pickDate(BuildContext context) async {
    try {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (pickedDate != null) {
        final age = calculateAge(pickedDate);
        dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
        ageController.text = age.toString();
        notifyListeners();
      }
    } catch (e) {
      throw Exception('Failed to pick date: $e');
    }
  }

  int calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  void saveMember() {
    // Implement save logic
    notifyListeners();
  }

  @override
  void dispose() {
    voterIdController.dispose();
    membershipController.dispose();
    nameController.dispose();
    mobileController.dispose();
    fatherNameController.dispose();
    addressController.dispose();
    districtController.dispose();
    dobController.dispose();
    ageController.dispose();
    super.dispose();
  }
}
