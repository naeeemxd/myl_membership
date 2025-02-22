// import 'package:flutter/material.dart';
// import 'package:myl_membership/model/members_Model.dart';


// class MembersProvider with ChangeNotifier {
//   final List<Member> _members = [
//     Member(
//       name: "John Doe",
//       phoneNumber: "1234567890",
//       district: "District A",
//       panchayath: "Panchayath X",
//       unit: "Unit 1",
//       age: "25",
//       bloodGroup: "O+",
//       status: "Registered",
//     ),
//     Member(
//       name: "Jane Smith",
//       phoneNumber: "0987654321",
//       district: "District B",
//       panchayath: "Panchayath Y",
//       unit: "Unit 2",
//       age: "30",
//       bloodGroup: "B+",
//       status: "Unpaid",
//     ),
//   ];

//   String _searchQuery = "";

//   List<Member> get members {
//     if (_searchQuery.isEmpty) {
//       return _members;
//     }
//     return _members
//         .where((member) =>
//             member.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
//             member.phoneNumber.toLowerCase().contains(_searchQuery.toLowerCase()))
//         .toList();
//   }

//   void updateSearchQuery(String query) {
//     _searchQuery = query;
//     notifyListeners();
//   }

//   void addMember(Member member) {
//     _members.add(member);
//     notifyListeners();
//   }
// }
