import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plant_app/features/home/home_provider.dart';
import 'package:plant_app/features/home/plant_grid_list.dart/plant_grid_list.dart';
import 'package:plant_app/features/home/search_plants/search.dart';

import '../../controllers/home_controller.dart';
import '../../models/blog.dart';
import '../../models/plant.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Future<Map> fetchHomeController() async {
    List<Plant> plantList = await HomeController.fetchPlants();
    List<Blog> blogList = await HomeController.fetchBlogs();
    return {
      "plants": plantList,
      "blogs": blogList,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map>(
        future: fetchHomeController(),
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
            final List<Plant> plants = snapshot.data!["plants"];
            final List<Blog> blogs = snapshot.data!["blogs"];

            return ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider(allPlants: plants),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      ..._buildTextWidgets(context),
                      const SizedBox(height: 12),
                      const SearchWidget(
                        hintText: "Search for plants",
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.075),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              "Get Started",
                              style: TextStyle(
                                color: Color(0xff13231B),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: blogs.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 300,
                              padding: index == 0
                                  ? EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.075)
                                  : EdgeInsets.symmetric(horizontal: 8),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(blogs[index].imageUri),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      width: 300,
                                      height: 60,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        blogs[index].title,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      const PlantGridList(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildTextWidgets(BuildContext context) {
    return [
      const SizedBox(height: 40),
      Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.075),
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
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.075),
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
    ];
  }
}
