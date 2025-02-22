import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myl_membership/model/members_Model.dart';

class MemberProvider extends ChangeNotifier {
  MemberModel _member = MemberModel();

  MemberModel get member => _member;

  final ImagePicker _picker = ImagePicker();

  void updateField(String field, String value) {
    switch (field) {
      case 'voterId':
        _member.voterId = value;
        break;
      case 'membershipNumber':
        _member.membershipNumber = value;
        break;
      case 'name':
        _member.name = value;
        break;
      case 'mobile':
        _member.mobile = value;
        break;
      case 'fatherName':
        _member.fatherName = value;
        break;
      case 'address':
        _member.address = value;
        break;
      case 'district':
        _member.district = value;
        break;
      case 'dob':
        _member.dob = value;
        break;
      case 'age':
        _member.age = value;
        break;
      case 'bloodGroup':
        _member.bloodGroup = value;
        break;
    }
    notifyListeners();
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _member.imagePath = image.path;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  void pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      int age = DateTime.now().year - pickedDate.year;
      if (DateTime.now().month < pickedDate.month ||
          (DateTime.now().month == pickedDate.month &&
              DateTime.now().day < pickedDate.day)) {
        age--;
      }

      _member.dob = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      _member.age = age.toString();
      notifyListeners();
    }
  }

  void reset() {
    _member = MemberModel();
    notifyListeners();
  }
}
