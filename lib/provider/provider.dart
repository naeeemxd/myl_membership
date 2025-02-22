import 'package:flutter/cupertino.dart';

import '../model/model.dart';

class CouncilorProvider extends ChangeNotifier {
  final List<Councilor> _councilors = [
    Councilor(
      name: 'Afif Saheer KP',
      phone: '+91 98765 43210',
      district: 'Malappuram',
      panchayath: 'Venara',
      unit: 'Venara Unit',
      age: '26',
      blood: 'AB +ve',
      image: 'assets/image2/Frame 154.png',
    ),
    Councilor(
      name: 'Rahul Mohan',
      phone: '+91 98765 43211',
      district: 'Kozhikode',
      panchayath: 'Oorakm',
      unit: 'Oorakm Unit',
      age: '30',
      blood: 'O +ve',
      image: 'assets/image2/Frame 154.png',
    ),
    Councilor(
      name: 'Vishnu Raj',
      phone: '+91 98765 43212',
      district: 'Kannur',
      panchayath: 'Puthiyangadi',
      unit: 'Puthiyangadi Unit',
      age: '29',
      blood: 'A -ve',
      image: 'assets/image2/Frame 154.png',
    ),
    Councilor(
      name: 'Rahul Mohan',
      phone: '+91 98765 43211',
      district: 'Kozhikode',
      panchayath: 'Oorakm',
      unit: 'Oorakm Unit',
      age: '30',
      blood: 'O +ve',
      image: 'assets/image2/Frame 154.png',
    ),
  ];

  int? _selectedIndex;

  List<Councilor> get councilors => _councilors;
  int? get selectedIndex => _selectedIndex;

  void selectCouncilor(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
