import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:refold_pocket_roadmap/features/roadmap/data/datasource/local_roadmap_datasource.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/repository/roadmap_repository.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/article/article_bloc.dart';

import 'features/roadmap/presentation/bloc/roadmap/roadmap_bloc.dart';
import 'features/roadmap/presentation/bloc/roadmaplist/roadmap_list_bloc.dart';

final getIt = GetIt.instance; // Service Locator

Future<void> init() async {
  // ROUTING
  getIt.registerSingleton<RouteObserver<ModalRoute<void>>>(RouteObserver<ModalRoute<void>>());

  // BLOCS
  getIt.registerFactory<RoadmapListBloc>(() => RoadmapListBloc(getIt()));
  getIt.registerFactory<RoadmapBloc>(() => RoadmapBloc(getIt()));
  getIt.registerFactory<ArticleBloc>(() => ArticleBloc(getIt()));

  // REPOSITORIES
  getIt.registerLazySingleton<RoadmapRepository>(() => RoadmapRepositoryImpl(
        localRoadmapDatasource: getIt(),
      ));

  // DATASOURCES
  getIt.registerLazySingleton<LocalRoadmapDatasource>(() => LocalRoadmapDatasourceImpl());

  // EXTERNAL
  // TODO: Use for favorites
  // final SharedPreferences sharedPreferences =
  //     await SharedPreferences.getInstance();
  // getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
