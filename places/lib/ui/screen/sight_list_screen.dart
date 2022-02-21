import 'package:flutter/material.dart';
import 'package:places_yakimova_project/main.dart';
import 'package:places_yakimova_project/mocks.dart';
import 'package:places_yakimova_project/ui/screen/sight_card.dart';

import 'const/colors.dart';
import 'const/values.dart';
import 'my_bottom_navigation_bar.dart';

class SightListScreen extends StatefulWidget {
  @override
  SightListScreenState createState() => SightListScreenState();
}

class SightListScreenState extends State<SightListScreen> {
  // ignore: avoid_returning_null_for_void

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: colorNavyBlue),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: standartSpacing,
                    right: standartSpacing,
                    top: standartTop,
                  ),
                  child: RichText(
                    text: const TextSpan(
                      text: textTitle,
                      style: TextStyle(
                        fontSize: standartSizeIndent,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              for (final sight in mocks)
                SightCard(
                  sight: sight,
                ),
              const SizedBox(height: standartSpacing),
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 0),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MyApp.of(context).toogleTheme();
          },
        ),
      );
}
