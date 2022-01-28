import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/app.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/repository/roadmap_repository.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmap/roadmap_bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmaplist/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/home_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/roadmap_page.dart';
import 'injection_container.dart' as di;
import 'core/util/common/app_themes.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}
