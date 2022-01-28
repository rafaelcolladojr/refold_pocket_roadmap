import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/article_page_args.dart';

class ArticlePage extends StatelessWidget {
  static String route = '/article';
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArticlePageArgs;

    // TODO: implement build
    throw UnimplementedError();
  }
}
