import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../models/plant.dart';
import '../home_provider.dart';

class PlantGridList extends StatelessWidget {
  const PlantGridList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Plant> plants =
        Provider.of<HomeProvider>(context).filteredPlants;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 80,
        maxHeight: double.infinity,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: plants.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) {
            final plant = plants[index];
            return Stack(
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
                  padding: const EdgeInsets.only(top: 6.0, left: 6.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.topLeft,
                    child: Text(
                      plant.name,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
