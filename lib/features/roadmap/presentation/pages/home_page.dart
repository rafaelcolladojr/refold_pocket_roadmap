import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_type.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_thumbnail_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmaplist/bloc.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/arguments/roadmap_page_args.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/roadmap_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/widgets/roadmap_list_item.dart';

class HomePage extends StatelessWidget {
  static String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double _toolbarHeight = deviceSize.height * 0.12;
    return BlocBuilder<RoadmapListBloc, RoadmapListState>(
      builder: (context, state) {
        if (state.status == RoadmapListStatus.failure) {
          return roadmapUnavailiable(deviceSize);
        }
        List<String> languages = _mapToLanguages(state.thumbnails);
        return DefaultTabController(
          length: state.status == RoadmapListStatus.success ? languages.length : 0,
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              elevation: 4.0,
              toolbarHeight: _toolbarHeight,
              centerTitle: false,
              title: SizedBox(
                height: _toolbarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText('Pocket\nRoadmaps', maxLines: 2, style: kTitle1.withColor(kPrimaryColorDark)),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(deviceSize.height * 0.08),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    isScrollable: true,
                    enableFeedback: false,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kPrimaryColorDark,
                    ),
                    unselectedLabelColor: kPrimaryColorDark,
                    tabs: state.status == RoadmapListStatus.success ? languages.map((lang) => Tab(text: lang)).toList() : [],
                  ),
                ),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo-primary.png'),
                    opacity: 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            body: SafeArea(
              bottom: false,
              child: Container(
                color: kPrimaryColorDark.withAlpha(20),
                child: TabBarView(
                  children: _stateToTabBarViewChildren(context, state),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Displayed if roadmap json files aren't available. (corrupt download?)
  Scaffold roadmapUnavailiable(Size deviceSize) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
              left: 16.0,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Pocket\nRoadmaps',
                    style: kTitle1.withColor(kPrimaryColorDark),
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(deviceSize.height * 0.10),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo-primary.png'),
              opacity: 0.2,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: kPrimaryColorDark.withAlpha(70),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Roadmap Information Unavailable', textAlign: TextAlign.center, style: kTitle3.withColor(kPrimaryColorDarkExtra.withAlpha(100))),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Please reinstall this applicaiton.', style: kTitle4.withColor(kPrimaryColorDarkExtra.withAlpha(100))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Convert thumbnails keys (RoadmapLanguage) to language tab labels
  List<String> _mapToLanguages(Map<RoadmapLanguage, List<RoadmapThumbnail>> thumbnails) {
    List<String> languages = List.empty(growable: true);
    for (RoadmapLanguage lang in thumbnails.keys) {
      String language = lang.toLargeString();
      if (!languages.contains(language)) languages.add(language);
    }

    return languages;
  }

  // Convert RoadmapThumbnail list to widgets or "coming soon" if empty
  List<Widget> _mapToWidgets(BuildContext context, Map<RoadmapLanguage, List<RoadmapThumbnail>> thumbnails) {
    List<Widget> widgets = [];
    for (RoadmapLanguage lang in thumbnails.keys) {
      Widget widget;
      if (thumbnails[lang]!.isEmpty) {
        widget = Center(
          child: Text(
            'Coming Soon',
            style: kTitle2.withColor(kPrimaryColorDarkExtra.withAlpha(100)),
          ),
        );
      } else {
        widget = ListView(
          children: _thumbnailsToWidgets(context, thumbnails[lang]!),
        );
      }
      widgets.add(widget);
    }
    return widgets;
  }

  // Convert RoadmapThumbnails to RoadmapListItems
  List<RoadmapListItem> _thumbnailsToWidgets(BuildContext context, List<RoadmapThumbnail> thumbnails) {
    List<RoadmapListItem> widgets = [];

    for (RoadmapThumbnail thumbnail in thumbnails) {
      widgets.add(RoadmapListItem(
        title: thumbnail.type.toLargeString(),
        enabled: thumbnail.enabled,
        backgroundImage: thumbnail.type == RoadmapType.quickstart ? AssetImage('assets/images/flag-${thumbnail.lang.toShortString()}.png') : null,
        onTap: () => Navigator.pushNamed(
          context,
          RoadmapPage.route,
          arguments: RoadmapPageArgs(type: thumbnail.type, lang: thumbnail.lang),
        ),
      ));
    }
    return widgets;
  }

  // Whether to display spinner on initial state or list contents (if any)
  List<Widget> _stateToTabBarViewChildren(BuildContext context, RoadmapListState state) {
    if (state.status == RoadmapListStatus.initial) {
      return _mapToSpinners(state.thumbnails);
    } else {
      return state.status == RoadmapListStatus.success ? _mapToWidgets(context, state.thumbnails) : [];
    }
  }

  // Generate (# of languages) spinners
  List<Widget> _mapToSpinners(Map<RoadmapLanguage, List<RoadmapThumbnail>> thumbnails) {
    List<Widget> widgets = [];
    thumbnails.forEach((key, value) {
      widgets.add(const Center(child: CircularProgressIndicator()));
    });
    return widgets;
  }
}
