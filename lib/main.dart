import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/repository/roadmap_repository.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmaplist/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/home_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/roadmap_page.dart';
import 'injection_container.dart' as di;
import 'core/util/app_themes.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoadmapListBloc>(
          create: (_) => RoadmapListBloc(di.getIt<RoadmapRepository>())..add(GetRoadmapListEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Refold Pocket Roadmap',
        theme: ThemeData(appBarTheme: kAppBarTheme),
        initialRoute: HomePage.route,
        routes: {
          HomePage.route: (_) => const HomePage(),
          RoadmapPage.route: (_) => const RoadmapPage(),
        },
      ),
    );
  }
}
