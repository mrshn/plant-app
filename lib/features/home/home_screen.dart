import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/plant.dart';

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
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("aaww"),
                    Text("aa"),
                    Text("aas"),
                    Text("aa"),
                    Text("aa"),
                    Text("aa"),
                    Text("aa"),
                    Text("aa"),
                    Text("aa"),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 80,
                        maxHeight: double.infinity,
                      ),
                      child: Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8),
                          scrollDirection: Axis.vertical,
                          itemCount: plants.length,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            final plant = plants[index];
                            return Card(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(
                                        image: NetworkImage(plant.image.url),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6.0, left: 6.0),
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        plant.name,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
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
