import 'package:flutter/material.dart';

class MyGardenScreen extends StatelessWidget {
  const MyGardenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'My Garden Screen',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
