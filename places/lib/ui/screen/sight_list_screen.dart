import 'package:flutter/material.dart';
import 'package:places_yakimova_project/mocks.dart';
import 'package:places_yakimova_project/ui/screen/sight_card.dart';

import 'const/strings.dart';
import 'const/values.dart';
import 'my_bottom_navigation_bar.dart';

class SightListScreen extends StatefulWidget {
  @override
  SightListScreenState createState() => SightListScreenState();
}

class SightListScreenState extends State<SightListScreen> {
  // ignore: prefer_void_to_null
  Null get color => null;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: color),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: standardSpacing,
                    right: standardSpacing,
                    top: 64,
                  ),
                  child: RichText(
                    text: const TextSpan(
                      text: titleText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: standartSizeIndent,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              for (final sight in mocks)
                SightCard(
                  sight: sight,
                ),
              const SizedBox(height: standardSpacing),
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 0),
      );
}
