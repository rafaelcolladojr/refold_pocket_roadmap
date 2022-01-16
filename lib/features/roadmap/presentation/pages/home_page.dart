import 'package:flutter/material.dart';
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
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: kAvailableRoadmaps.length,
          child: Container(
            color: kPrimaryColorDark.withAlpha(70),
            child: Column(
              children: [
                Material(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.2,
                        image: AssetImage('assets/images/logo-primary.png'),
                        alignment: Alignment.topLeft,
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    height: deviceInfo.size.height * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.menu,
                                  color: kPrimaryColorDark,
                                  size: 30.0,
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Pocket Roadmaps",
                              style: kTitle1.withColor(kPrimaryColorDark)),
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
                ),
                Expanded(
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
                          ),
                        ],
                      ),
                      ListView(
                        children: const [
                          RoadmapListItem(
                            title: "Quickstart Guide",
                            backgroundImage:
                                AssetImage('assets/images/flag-es.png'),
                          ),
                          RoadmapListItem(
                            title: "Simplified Roadmap",
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          'Coming Soon',
                          style: kTitle2.withColor(kPrimaryColorDarkExtra),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Coming Soon',
                          style: kTitle2.withColor(kPrimaryColorDarkExtra),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
