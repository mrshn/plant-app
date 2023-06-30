import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'plant_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PlantApp());
}
