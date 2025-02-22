import 'package:flutter/material.dart';
import 'package:myl_membership/Committee/add_Executive.dart';
import 'package:myl_membership/model/executive_model.dart';

class ExecutiveProvider extends ChangeNotifier {
  final List<Executive> _executives = [
    Executive(
      name: "John Doe",
      phone: "+91 9876543210",
      district: "Ernakulam",
      panchayath: "Aluva",
      unit: "Unit A",
      age: "26",
      bloodGroup: "AB +ve",
      image: "assets/image2/Frame 154.png",
    ),
    Executive(
      name: "Jane Smith",
      phone: "+91 9876543211",
      district: "Thrissur",
      panchayath: "Chalakudy",
      unit: "Unit B",
      age: "32",
      bloodGroup: "O +ve",
      image: "assets/image2/Frame 154.png",
    ),
    Executive(
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

  String _searchQuery = '';
  int? _selectedIndex;

  List<Executive> get executives => _executives;
  String get searchQuery => _searchQuery;
  int? get selectedIndex => _selectedIndex;

  List<Executive> get filteredExecutives {
    if (_searchQuery.isEmpty) return _executives;
    return _executives.where((executive) {
      return executive.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          executive.district.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          executive.panchayath.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSelectedIndex(int? index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void addExecutive(Executive executive) {
    _executives.add(executive);
    notifyListeners();
  }
}