import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/home_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/roadmap_page.dart';

import 'core/util/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Refold Pocket Roadmap',
      theme: ThemeData(appBarTheme: kAppBarTheme),
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (_) => const HomePage(),
        RoadmapPage.route: (_) => const RoadmapPage(),
      },
    );
  }
}
