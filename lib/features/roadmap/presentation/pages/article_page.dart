import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/article/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/article_page_args.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/widgets/article_html.dart';
import 'package:refold_pocket_roadmap/injection_container.dart' as di;

class ArticlePage extends StatefulWidget {
  static String route = '/article';
  const ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> with RouteAware {
  late RouteObserver routeObserver;

  @override
  void initState() {
    super.initState();
    routeObserver = di.getIt<RouteObserver<ModalRoute<void>>>();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArticlePageArgs;
    BlocProvider.of<ArticleBloc>(context).add(GetArticleEvent(id: args.articleId));
    return BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
      if (state.status == ArticleStatus.success) {
        return _articlePage(context, state.article);
      } else {
        return _articlePage(context, null);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
  }

  @override
  void didPopNext() {
    BlocProvider.of<ArticleBloc>(context).add(PopArticleEvent());
    // Covering route was popped off the navigator.
  }
}

Widget _articlePage(BuildContext context, Article? article) {
  Size deviceSize = MediaQuery.of(context).size;
  double _toolbarHeight = deviceSize.height * 0.15;

  String title = article == null ? 'Article Title' : article.title;
  String titleTrim = '';
  String code = '';

  var firstColonIndex = title.indexOf(':'); // Returns -1 if colon doensn't exist in title
  if (firstColonIndex == -1) {
    titleTrim = title;
  } else {
    // Everything after first instance of ':'
    // eg. Title='Stage 3: Learn to Speak'
    //     Returns 'Learn to Speak'
    titleTrim = title.substring(firstColonIndex + 1).trim();
    // Everything before first instance of ':'
    code = title.substring(0, firstColonIndex);
  }

  String body = article == null ? '' : article.body;
  return Scaffold(
    appBar: AppBar(
      elevation: 4.0,
      toolbarHeight: _toolbarHeight,
      title: SizedBox(
        height: _toolbarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(code, style: kTitle3),
            AutoSizeText(titleTrim, style: kTitle1.withColor(kPrimaryColorDark), maxLines: 2),
          ],
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: IconButton(onPressed: null, icon: Icon(Icons.favorite_border, color: kPrimaryColorDark, size: 30.0)),
        ),
      ],
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
