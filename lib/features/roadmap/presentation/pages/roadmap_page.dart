import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_type.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmap/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/roadmap_page_args.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/widgets/stage_list_item.dart';

class RoadmapPage extends StatelessWidget {
  static String route = '/roadmap';
  const RoadmapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as RoadmapPageArgs;
    BlocProvider.of<RoadmapBloc>(context).add(GetRoadmapEvent(type: args.type, lang: args.lang));
    String title = args.type.toLargeString();

    MediaQueryData deviceInfo = MediaQuery.of(context);
    return BlocBuilder<RoadmapBloc, RoadmapState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(color: kPrimaryColor, onPressed: () {}, icon: const Icon(Icons.search, color: kPrimaryColor, size: 30.0)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu, color: kPrimaryColor, size: 30.0)),
            ],
          ),
          body: SafeArea(
            child: Container(
              color: kBackgroundColorDark,
              child: Column(
                children: [
                  Material(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: deviceInfo.size.height * 0.10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(title, style: kTitle1),
                          ),
                          Row()
                        ],
                      ),
                    ),
                  ),
                  state.status == RoadmapStatus.success ? _roadmapToStageList(state.roadmap!) : const Center(child: CircularProgressIndicator())
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _roadmapToStageList(Roadmap roadmap) {
    List<StageListItem> listItems = [];
    roadmap.stages.asMap().forEach((index, stage) {
      listItems.add(StageListItem(
        marker: stage.subtitle,
        title: stage.headline,
        subtitle: stage.intro,
        color: stageListIndexToColor(index),
      ));
    });
    return Expanded(
      child: ListView.separated(itemBuilder: (_, index) => listItems[index], separatorBuilder: (_, index) => const SizedBox(height: 8.0), itemCount: listItems.length),
    );
  }

  Color stageListIndexToColor(int index) {
    final colors = [kPrimaryColorLight, kPrimaryColor, kPrimaryColorDark, kPrimaryColorDarkExtra, kPrimaryColorDisabled];

    return colors[min(index, colors.length - 1)];
  }
}
