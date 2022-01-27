import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/util/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/app_text_styles.dart';
import 'package:refold_pocket_roadmap/core/util/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/roadmap_type.dart';
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
    return BlocBuilder<RoadmapListBloc, RoadmapListState>(
      builder: (context, state) {
        List<String> languages = _mapToLanguages(state.thumbnails);
        return DefaultTabController(
          length: state.status == RoadmapListStatus.success ? languages.length : 0,
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: kPrimaryColorDark,
                    size: 30.0,
                  ),
                ),
              ],
              bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                    left: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Pocket\nRoadmaps',
                          style: kTitle1.withColor(kPrimaryColorDark),
                        ),
                      ),
                      TabBar(
                        isScrollable: true,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kPrimaryColorDark,
                        ),
                        unselectedLabelColor: kPrimaryColorDark,
                        tabs: state.status == RoadmapListStatus.success ? languages.map((lang) => Tab(text: lang)).toList() : [],
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(deviceSize.height * 0.15),
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

  List<String> _mapToLanguages(Map<RoadmapLanguage, List<RoadmapThumbnail>> thumbnails) {
    List<String> languages = List.empty(growable: true);
    for (RoadmapLanguage lang in thumbnails.keys) {
      String language = lang.toLargeString();
      if (!languages.contains(language)) languages.add(language);
    }

    return languages;
  }

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
          arguments: RoadmapPageArgs(thumbnail.toRoadmapId()),
        ),
      ));
    }
    return widgets;
  }

  List<Widget> _stateToTabBarViewChildren(BuildContext context, RoadmapListState state) {
    if (state.status == RoadmapListStatus.initial) {
      return _mapToSpinners(state.thumbnails);
    } else {
      return state.status == RoadmapListStatus.success ? _mapToWidgets(context, state.thumbnails) : [];
    }
  }

  List<Widget> _mapToSpinners(Map<RoadmapLanguage, List<RoadmapThumbnail>> thumbnails) {
    List<Widget> widgets = [];
    thumbnails.forEach((key, value) {
      widgets.add(const Center(child: CircularProgressIndicator()));
    });
    return widgets;
  }
}
