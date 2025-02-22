import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myl_membership/provider/member_provider.dart';
import 'package:provider/provider.dart';
import 'package:myl_membership/payment/selectPayment.dart';
import 'package:myl_membership/cutom_widget/appbar.dart';

class MemberRegistration extends StatelessWidget {
  const MemberRegistration({super.key});

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
    return Consumer<MemberRegistrationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const PaymentAppBar(title: "Member Registration"),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildTextField(provider.voterIdController, 'Voter ID Number'),

                // Profile Photo Section
                GestureDetector(
                  onTap: () => provider.pickImage(),
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
                              provider.imageFile != null
                                  ? ClipOval(
                                    child: Image.file(
                                      provider.imageFile!,
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
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 26),

                _buildTextField(
                  provider.membershipController,
                  'Membership Number',
                ),
                _buildTextField(provider.nameController, 'Name'),
                _buildTextField(provider.mobileController, 'Mobile Number'),
                _buildTextField(provider.fatherNameController, 'Father Name'),
                _buildTextField(provider.addressController, 'Address'),
                _buildTextField(provider.districtController, 'District'),

                // Date of Birth and Age Row
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: provider.dobController,
                        readOnly: true,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "assets/logo/calander.svg",
                              height: 24,
                              width: 24,
                            ),
                          ),
                          labelText: 'DOB',
                          labelStyle: TextStyle(color: Colors.grey[600]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                        onTap: () => provider.pickDate(context),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: provider.ageController,
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

                // Blood Group Dropdown
                TextField(
                  controller: provider.bloodController,
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: provider.selectedBloodGroup,
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            "assets/logo/arrow-down-01.svg",
                            height: 24,
                            width: 24,
                          ),
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            provider.setBloodGroup(newValue);
                            provider.bloodController.text = newValue;
                          }
                        },
                        items:
                            provider.bloodGroups.map((String group) {
                              return DropdownMenuItem<String>(
                                value: group,
                                child: Text(group),
                              );
                            }).toList(),
                      ),
                    ),

                    labelText: 'Blood Group',
                    // hintText: provider.selectedBloodGroup ?? "Select Blood Group",
                    labelStyle: TextStyle(color: Colors.grey[600]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),

                const SizedBox(height: 32),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: provider.saveMember,
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
                              MaterialPageRoute(
                                builder: (context) => PaymentScreen(),
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
      },
    );
  }
}
