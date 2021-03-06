import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_type.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmap/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/roadmap_page_args.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/stage_page_args.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/stage_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/widgets/stage_list_item.dart';

class RoadmapPage extends StatelessWidget {
  static String route = '/roadmap';
  const RoadmapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as RoadmapPageArgs;
    BlocProvider.of<RoadmapBloc>(context).add(GetRoadmapEvent(type: args.type, lang: args.lang));
    String title = args.type.toLargeString();

    Size deviceSize = MediaQuery.of(context).size;
    double _toolbarHeight = deviceSize.height * 0.15;
    return BlocBuilder<RoadmapBloc, RoadmapState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            // automaticallyImplyLeading: false,
            toolbarHeight: _toolbarHeight,
            elevation: 4.0,
            centerTitle: false,
            title: SizedBox(
              height: _toolbarHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    title,
                    style: kTitle1.withColor(kPrimaryColorDark),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            // actions: const [
            //   IconButton(
            //       onPressed: null,
            //       icon: Icon(
            //         Icons.more_vert,
            //         color: kPrimaryColor,
            //       )),
            // ],
          ),
          body: SafeArea(
            bottom: false,
            child: Container(
              color: kBackgroundColorDark,
              child: Column(
                children: [
                  state.status == RoadmapStatus.success
                      ? _roadmapToStageList(context, state.roadmap!)
                      : const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _roadmapToStageList(BuildContext context, Roadmap roadmap) {
    List<StageListItem> listItems = [];
    roadmap.stages.asMap().forEach((index, stage) {
      listItems.add(StageListItem(
        marker: stage.subtitle,
        title: stage.headline,
        subtitle: stage.intro,
        color: stageListIndexToColor(index),
        onTap: () => Navigator.pushNamed(context, StagePage.route, arguments: StagePageArgs(stage: stage)),
      ));
    });
    return Expanded(
      child: ListView.separated(
        itemBuilder: (_, index) => listItems[index],
        separatorBuilder: (_, index) => const SizedBox(height: 8.0),
        itemCount: listItems.length,
      ),
    );
  }

  Color stageListIndexToColor(int index) {
    final colors = [
      kPrimaryColorLight,
      kPrimaryColor,
      kPrimaryColorDark,
      kPrimaryColorDarkExtra,
      kPrimaryColorDisabled,
    ];

    // repeat last entry
    int colorIndex = min(index, colors.length - 1);
    return colors[colorIndex];
  }
}
