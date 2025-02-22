import 'package:flutter/material.dart';

import '../model/model.dart';

class SearchProvider with ChangeNotifier {
  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void resetSearchQuery() {
    _searchQuery = '';
    notifyListeners();
  }

  List<Councilor> getFilteredCouncilors(List<Councilor> councilors) {
    if (_searchQuery.isEmpty) {
      return councilors;
    }
    return councilors
        .where((councilor) =>
        councilor.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }
}