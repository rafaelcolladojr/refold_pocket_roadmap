import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/article_page_args.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/widgets/article_html.dart';

class ArticlePage extends StatelessWidget {
  static String route = '/article';
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArticlePageArgs;
    final article = args.article;

    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(deviceSize.height * 0.08),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 10,
                  child: Text(article.title, style: kTitle1.withColor(kPrimaryColorDark)),
                ),
                const Flexible(
                  child: IconButton(onPressed: null, icon: Icon(Icons.more_vert, color: kPrimaryColor)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: ArticleHtml(articleBody: article.body),
          ),
        ),
      ),
    );
  }
}
