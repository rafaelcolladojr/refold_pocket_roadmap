import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/app.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}
