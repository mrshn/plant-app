import 'package:flutter/material.dart';

import '../../models/plant.dart';

class HomeProvider with ChangeNotifier {
  late List<Plant> allPlants;
  late List<Plant> filteredPlants;

  HomeProvider({
    required this.allPlants,
  }) {
    filteredPlants = allPlants;
  }

  void searchPlants(String query) {
    filteredPlants = allPlants
        .where(
            (plant) => plant.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
