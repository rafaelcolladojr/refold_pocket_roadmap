import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';

class ArticleHtml extends StatelessWidget {
  const ArticleHtml({
    Key? key,
    required this.articleBody,
  }) : super(key: key);

  final String articleBody;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: articleBody,
      onLinkTap: _onLinkTap,
      style: {
        'p': Style.fromTextStyle(kParagraph.withColor(Colors.black)),
        'h3': Style.fromTextStyle(kTitle2),
        'h4': Style.fromTextStyle(kTitle3),
        'h6': Style.fromTextStyle(kTitle6),
        'a.header-link': Style(display: Display.NONE),
        'a': Style(color: kPrimaryColor),
        'a[href^="#footnote"]': Style.fromTextStyle(kArticleFootnote),
        'a[name^="footnote"]': Style.fromTextStyle(kArticleFootnote),
      },
    );
  }
}

void _onLinkTap(url, context, attributes, element) {
  if (url == null) return;
  launch(url);
}
