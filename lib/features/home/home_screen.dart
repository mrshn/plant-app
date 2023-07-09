import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plant_app/features/home/home_provider.dart';
import 'package:plant_app/features/home/plant_grid_list.dart/plant_grid_list.dart';
import 'package:plant_app/features/home/search_plants/search.dart';

import '../../models/plant.dart';
import 'package:provider/provider.dart';

import 'sign_box/sign_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<List<PlantModel>> fetchPlants() async {
    final url =
        Uri.parse('https://dummy-api-jtg6bessta-ey.a.run.app/getCategories');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)["data"];

      return List<PlantModel>.from(
        jsonData.map((plantData) => PlantModel.fromJson(plantData)),
      );
    } else {
      throw Exception('Failed to fetch plants');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PlantModel>>(
        future: fetchPlants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final plants = snapshot.data!;
            return ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider(allPlants: plants),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.075),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hi, plant loverr!',
                            style: TextStyle(
                              color: Color(0xff13231B),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.075),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Good Afternoon!',
                            style: TextStyle(
                              color: Color(0xff13231B),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SearchWidget(
                        hintText: "Search for plants",
                      ),
                      const SizedBox(height: 12),
                      const PlantGridList(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
