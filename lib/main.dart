import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/presentation/pages/home_page.dart';

import 'common/app_themes.dart';

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
      },
    );
  }
}
