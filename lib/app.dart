import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_themes.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/article/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmap/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmaplist/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/article_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/home_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/roadmap_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/stage_page.dart';
import 'injection_container.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoadmapListBloc>(create: (_) => di.getIt<RoadmapListBloc>()..add(GetRoadmapListEvent())),
        BlocProvider<RoadmapBloc>(create: (_) => di.getIt<RoadmapBloc>()),
        BlocProvider<ArticleBloc>(create: (_) => di.getIt<ArticleBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Refold Pocket Roadmap',
        theme: ThemeData(appBarTheme: kAppBarTheme),
        initialRoute: HomePage.route,
        routes: {
          HomePage.route: (_) => const HomePage(),
          RoadmapPage.route: (_) => const RoadmapPage(),
          StagePage.route: (_) => const StagePage(),
          ArticlePage.route: (_) => const ArticlePage(),
        },
        navigatorObservers: [di.getIt<RouteObserver<ModalRoute<void>>>()],
      ),
    );
  }
}
