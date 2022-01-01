import 'dart:html';

import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/common/app_colors.dart';

class HomePage extends StatelessWidget {
  static String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return SafeArea(
      child: Container(
        color: Colors.grey.shade200,
        child: Column(
          children: [
            Material(
              color: Colors.white,
              elevation: 4.0,
              child: SizedBox(
                height: deviceInfo.size.height * 0.15,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            color: kPrimaryColor,
                            onPressed: () {},
                            icon:
                                const Icon(Icons.search, color: kPrimaryColor)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu, color: kPrimaryColor)),
                      ],
                    ),
                    const Text("Roadmap"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
