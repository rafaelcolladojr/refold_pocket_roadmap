import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/article/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/article_page_args.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/widgets/article_html.dart';

class ArticlePage extends StatelessWidget {
  static String route = '/article';
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArticlePageArgs;
    if (args.article != null) {
      return _articlePage(context, args.article!);
    } else {
      BlocProvider.of<ArticleBloc>(context).add(GetArticleEvent(id: args.articleId!));
      return BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
        if (state.status == ArticleStatus.success) {
          return _articlePage(context, state.article);
        } else {
          return _articlePage(context, null);
        }
      });
    }
  }
}

Widget _articlePage(BuildContext context, Article? article) {
  Size deviceSize = MediaQuery.of(context).size;
  String title = article == null ? "Article Title" : article.title;
  String body = article == null ? "" : article.body;
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
                child: Text(title, style: kTitle1.withColor(kPrimaryColorDark)),
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
      child: SingleChildScrollView(
        child: Container(
          color: kPrimaryColorDark.withAlpha(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: body != "" ? ArticleHtml(articleBody: body) : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    ),
  );
}
