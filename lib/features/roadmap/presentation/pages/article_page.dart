import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/article_page_args.dart';

class ArticlePage extends StatelessWidget {
  static String route = '/article';
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArticlePageArgs;
    final article = args.article;

    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle.dark,
      // ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(article.title, style: kTitle1.withColor(kPrimaryColorDark)),
                const SizedBox(height: 16.0),
                Html(
                  data: article.body,
                  style: {
                    "p": Style.fromTextStyle(kParagraph.withColor(Colors.black)),
                    "h3": Style.fromTextStyle(kTitle3),
                    "a.header-link": Style(
                      display: Display.NONE,
                    ),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
