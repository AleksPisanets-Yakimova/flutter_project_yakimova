import 'package:flutter/material.dart';
import 'package:places_yakimova_project/main.dart';
import 'package:places_yakimova_project/mocks.dart';
import 'package:places_yakimova_project/ui/screen/sight_card.dart';

// import 'const/colors.dart';
import 'package:places_yakimova_project/ui/screen/const/styles.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';
import 'package:places_yakimova_project/ui/screen/my_bottom_navigation_bar.dart';

class SightListScreen extends StatefulWidget {
  @override
  SightListScreenState createState() => SightListScreenState();
}

class SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = MyApp.themeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: theme.colorDecoration,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.standartSpacing,
                  right: AppSizes.standartSpacing,
                  top: AppSizes.standartTop,
                ),
                child: Text(
                  AppTexts.textTitle,
                  style: AppTypography.textPageTitle
                      .withColor(theme.colorTextTitle),
                  maxLines: 2,
                ),
              ),
            ),
            for (final sight in mocks)
              SightCard(
                sight: sight,
              ),
            const SizedBox(height: AppSizes.standartSpacing),
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
}
