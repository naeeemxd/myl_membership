import 'package:flutter/material.dart';
import 'package:myl_membership/dummy.dart';

class MembersProvider extends ChangeNotifier {
  String _searchQuery = "";

  String get searchQuery => _searchQuery;

  List<Map<String, String>> get filteredMembers =>
      members
          .where(
            (member) =>
                member["name"]!.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ) ||
                member["phoneNumber"]!.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ),
          )
          .toList();

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
