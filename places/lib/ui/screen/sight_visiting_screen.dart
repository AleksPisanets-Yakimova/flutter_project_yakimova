import 'package:flutter/material.dart';

import 'package:places_yakimova_project/ui/screen/sight_favorite_place.dart';
import 'package:places_yakimova_project/ui/screen/sight_places_visited.dart';

import '../../main.dart';
import '../../mocks.dart';

import 'const/colors.dart';
import 'const/styles.dart';
import 'const/values.dart';
import 'my_bottom_navigation_bar.dart';

class VisitingScreen extends StatefulWidget {
  @override
  VisitingScreenState createState() => VisitingScreenState();
}

class VisitingScreenState extends State with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    //обновляем страницу, для перерисовки текущего виждета на экране
    //т.е. когда тапаем по иконке и она меняет страницу - иконка должна менять увет на активную
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = MyApp.themeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            textFavorites,
            style: textSightVisFavorite, //.withColor(theme.colorTextTitle),
          ),
        ),
        backgroundColor: theme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(standartSpacing),
        child: Column(
          children: [
            Container(
              height: standartHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  standartHeight,
                ),
                color: theme.colorTabBarUnselectedBack,
              ),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  color: theme.colorTabBarSelectedBack,
                  borderRadius: BorderRadius.circular(
                    standartHeight,
                  ),
                ),
                tabs: const [
                  Text(textWantToVisit,
                      style: textSightVisTab), //.withColor(colorBlack),),
                  Text(textVisited, style: textSightVisTab)
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SightCardFavoritePlace(
                          sight: mocks[0],
                        ),
                        SightCardFavoritePlace(
                          sight: mocks[2],
                        ),
                        SightCardFavoritePlace(
                          sight: mocks[3],
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SightCardPlaceVisited(
                          sight: mocks[5],
                        ),
                        SightCardPlaceVisited(
                          sight: mocks[4],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyApp.of(context).toogleTheme();
        },
      ),
    );
  }
}
