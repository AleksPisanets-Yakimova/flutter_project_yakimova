import 'package:flutter/material.dart';
import 'package:places_yakimova_project/main.dart';
import 'package:places_yakimova_project/mocks.dart';
import 'package:places_yakimova_project/ui/screen/const/colors.dart';
import 'package:places_yakimova_project/ui/screen/const/styles.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';
import 'package:places_yakimova_project/ui/screen/my_bottom_navigation_bar.dart';
import 'package:places_yakimova_project/ui/screen/rez/my_theme_data.dart';
import 'package:places_yakimova_project/ui/screen/sight_favorite_place.dart';

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
    //т.е. когда тапаем по иконке и она меняет страницу - иконка должна менять цвет на активную
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = MyApp.themeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppTexts.textFavorites,
            style: AppTypography.textSightVisFavorite
                .withColor(theme.colorTextTitle),
          ),
        ),
        backgroundColor: theme.background,
      ),
      body: _TabBarMain(
        tabController: tabController,
        theme: theme,
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

class _TabBarContent extends StatelessWidget {
  const _TabBarContent({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SightCardFavoritePlace(
                  sight: mocks[0],
                  visited: true,
                ),
                SightCardFavoritePlace(
                  sight: mocks[2],
                  visited: true,
                ),
                SightCardFavoritePlace(
                  sight: mocks[3],
                  visited: true,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SightCardFavoritePlace(
                  sight: mocks[3],
                  visited: false,
                ),
                SightCardFavoritePlace(
                  sight: mocks[5],
                  visited: false,
                ),
                SightCardFavoritePlace(
                  sight: mocks[4],
                  visited: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBarMain extends StatelessWidget {
  const _TabBarMain({
    Key? key,
    required this.tabController,
    required this.theme,
  }) : super(key: key);

  final TabController tabController;
  final MyThemeData theme;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(AppSizes.standartSpacing),
        child: Column(
          children: [
            Container(
              height: AppSizes.standartHeightBig,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppSizes.standartHeightBig,
                ),
                color: theme.colorTabBarUnselectedBack,
              ),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  color: theme.colorTabBarSelectedBack,
                  borderRadius: BorderRadius.circular(
                    AppSizes.standartHeightBig,
                  ),
                ),
                tabs: [
                  Text(
                    AppTexts.textWantToVisit,
                    style: AppTypography.textSightVisTab
                        .withColor(AppColors.colorBlack),
                  ),
                  const Text(AppTexts.textVisited,
                      style: AppTypography.textSightVisTab)
                ],
              ),
            ),
            _TabBarContent(
              tabController: tabController,
            ),
          ],
        ),
      );
}
