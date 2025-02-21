import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:myl_membership/voterid.dart';

class MemberRegistration extends StatefulWidget {
  const MemberRegistration({super.key});

  @override
  State<MemberRegistration> createState() => _MemberRegistrationState();
}

class _MemberRegistrationState extends State<MemberRegistration> {
  // Controllers
  final _voterIdController = TextEditingController();
  final _membershipController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _districtController = TextEditingController();
  final _dobController = TextEditingController();
  final _ageController = TextEditingController();
  final _bloodGroupController = TextEditingController();

  File? _imageFile;
  final _picker = ImagePicker();

  @override
  void dispose() {
    _voterIdController.dispose();
    _membershipController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _fatherNameController.dispose();
    _addressController.dispose();
    _districtController.dispose();
    _dobController.dispose();
    _ageController.dispose();
    _bloodGroupController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() => _imageFile = File(image.path));
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick image: $e')));
    }
  }

  Future<void> _pickDate() async {
    try {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (pickedDate != null) {
        final age = _calculateAge(pickedDate);
        setState(() {
          _dobController.text =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          _ageController.text = age.toString();
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick date: $e')));
    }
  }

  int _calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
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
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField(_voterIdController, 'Voter ID Number'),

            // Profile Photo Section
            GestureDetector(
              onTap: _pickImage,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child:
                          _imageFile != null
                              ? ClipOval(
                                child: Image.file(
                                  _imageFile!,
                                  fit: BoxFit.cover,
                                ),
                              )
                              : const CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://cdn3.iconfinder.com/data/icons/web-design-and-development-2-6/512/87-1024.png",
                                ),
                              ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Upload Photo',
                      style: TextStyle(color: Colors.blue[700], fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 26),

            _buildTextField(_membershipController, 'Membership Number'),
            _buildTextField(_nameController, 'Name'),
            _buildTextField(_mobileController, 'Mobile Number'),
            _buildTextField(_fatherNameController, 'Father Name'),
            _buildTextField(_addressController, 'Address'),
            _buildTextField(_districtController, 'District'),

            // Modified Date of Birth and Age Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'DOB',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          _dobController.text =
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";

                          // Calculate age
                          int age = DateTime.now().year - pickedDate.year;
                          if (DateTime.now().month < pickedDate.month ||
                              (DateTime.now().month == pickedDate.month &&
                                  DateTime.now().day < pickedDate.day)) {
                            age--;
                          }
                          _ageController.text = age.toString();
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _ageController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            _buildTextField(_bloodGroupController, 'Blood Group'),

            const SizedBox(height: 32),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle save
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
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
                          MaterialPageRoute(builder: (context) => Voterid()),
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
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
