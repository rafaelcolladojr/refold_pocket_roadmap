import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Refold Pocket Roadmap',
      home: HomePage(),
    );
  }
}
