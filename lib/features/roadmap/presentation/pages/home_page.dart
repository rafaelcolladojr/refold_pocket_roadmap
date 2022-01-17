import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:refold_pocket_roadmap/config/config.dart';
import 'package:refold_pocket_roadmap/core/util/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/app_text_styles.dart';
import 'package:refold_pocket_roadmap/core/util/roadmap_language.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/pages/roadmap_page.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/widgets/roadmap_list_item.dart';

class HomePage extends StatelessWidget {
  static String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: kAvailableRoadmaps.length,
      child: Scaffold(
        appBar: AppBar(
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
              padding: const EdgeInsets.only(bottom: 8.0),
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
                    tabs: kAvailableRoadmaps.keys
                        .map((lang) => Tab(text: lang.toLargeString()))
                        .toList(),
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
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SafeArea(
          bottom: false,
          child: Container(
            color: kPrimaryColorDark.withAlpha(70),
            child: Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      RoadmapListItem(
                        title: "Detailed Roadmap",
                        onTap: () {
                          Navigator.pushNamed(context, RoadmapPage.route);
                        },
                      ),
                      const RoadmapListItem(
                        title: "Simplified Roadmap",
                        enabled: false,
                      ),
                    ],
                  ),
                  ListView(
                    children: const [
                      RoadmapListItem(
                        title: "Quickstart Guide",
                        enabled: false,
                        backgroundImage:
                            AssetImage('assets/images/flag-es.png'),
                      ),
                      RoadmapListItem(
                        title: "Simplified Roadmap",
                        enabled: false,
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      'Coming Soon',
                      style: kTitle2
                          .withColor(kPrimaryColorDarkExtra.withAlpha(100)),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Coming Soon',
                      style: kTitle2
                          .withColor(kPrimaryColorDarkExtra.withAlpha(100)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
