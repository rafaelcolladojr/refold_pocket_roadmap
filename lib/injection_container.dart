import 'package:get_it/get_it.dart';
import 'package:refold_pocket_roadmap/features/roadmap/data/datasource/local_roadmap_datasource.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/repository/roadmap_repository.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmaplist/bloc.dart';

final getIt = GetIt.instance; // Service Locator

Future<void> init() async {
  // BLOCS
  getIt.registerFactory<RoadmapListBloc>(() => RoadmapListBloc(getIt()));

  // REPOSITORIES
  getIt.registerLazySingleton<RoadmapRepository>(() => RoadmapRepositoryImpl(
        localRoadmapDatasource: getIt(),
      ));

  // DATASOURCES
  getIt.registerLazySingleton<LocalRoadmapDatasource>(
      () => LocalRoadmapDatasourceImpl());

  // EXTERNAL
  // final SharedPreferences sharedPreferences =
  //     await SharedPreferences.getInstance();
  // getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
