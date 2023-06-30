import 'package:flutter/material.dart';

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Diagnose Screen',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
