import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/stage_details_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/stage_page_args.dart';

class StagePage extends StatelessWidget {
  static String route = '/stage';
  const StagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as StagePageArgs;
    final stage = args.stage;

    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: kPrimaryColor,
          onPressed: () {},
          icon: const Icon(Icons.search, color: kPrimaryColor, size: 30.0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: kPrimaryColor, size: 30.0),
          ),
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
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(stage.headline, style: kTitle1),
                  ),
                ),
              ),
              _stageDetailsToWidgets(context, stage.details)
            ],
          ),
        ),
      ),
    );
  }

  Widget _stageDetailsToWidgets(BuildContext context, StageDetails details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Stage Overview:'),
      ],
    );
  }
}
