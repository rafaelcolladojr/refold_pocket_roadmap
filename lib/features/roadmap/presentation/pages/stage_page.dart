import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/stage_details_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/article_page_args.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/stage_page_args.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/article_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/widgets/article_list_item.dart';

class StagePage extends StatelessWidget {
  static String route = '/stage';
  const StagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as StagePageArgs;
    final stage = args.stage;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(stage.subtitle, style: kTitle4),
              Text(stage.headline, style: kTitle1.withColor(kPrimaryColorDark)),
              const SizedBox(height: 16.0),
              Text(stage.intro, style: kParagraph),
              const SizedBox(height: 16.0),
              // TODO: Add overview article here
              ..._stageDetailsToWidgets(context, stage.details),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _stageDetailsToWidgets(BuildContext context, StageDetails details) {
    List<Widget> widgets = [];

    for (var section in details.articleSections) {
      widgets.add(Text(section.title, style: kTitle3));
      widgets.add(const SizedBox(height: 16.0));

      List<Widget> sectionArticles = [];
      section.articles.asMap().forEach((index, article) {
        sectionArticles.add(
          ArticleListItem(
            title: article.title,
            onTap: () => Navigator.pushNamed(context, ArticlePage.route, arguments: ArticlePageArgs(article: article)),
          ),
        );
      });
      widgets.add(SizedBox(
        height: 140.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          children: sectionArticles,
        ),
      ));
      widgets.add(const SizedBox(height: 16.0));
    }

    return widgets;
  }
}
