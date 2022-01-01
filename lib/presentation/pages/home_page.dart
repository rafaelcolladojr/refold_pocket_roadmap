import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/common/app_colors.dart';
import 'package:refold_pocket_roadmap/common/app_text_styles.dart';

class HomePage extends StatelessWidget {
  static String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              color: kPrimaryColor,
              onPressed: () {},
              icon: const Icon(Icons.search, color: kPrimaryColor, size: 30.0)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu, color: kPrimaryColor, size: 30.0)),
          ]),
      body: SafeArea(
        child: Container(
          color: kBackgroundColorDark,
          child: Column(
            children: [
              Material(
                color: Colors.white,
                elevation: 4.0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: deviceInfo.size.height * 0.10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Detailed Roadmap", style: kTitle1),
                      ),
                      Row()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
