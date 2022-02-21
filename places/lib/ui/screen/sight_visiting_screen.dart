import 'package:flutter/material.dart';
import 'package:places_yakimova_project/ui/screen/const/colors.dart';
import 'package:places_yakimova_project/ui/screen/sight_favorite_place.dart';
import 'package:places_yakimova_project/ui/screen/sight_places_visited.dart';

import '../../mocks.dart';
import 'const/colors.dart';
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

  static const textWantToVisit = 'Хочу посетить';
  static const textVisited = 'Посетил';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Избранное',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          backgroundColor: sightCardBackground,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          // Добавляем Theme чтобы при свайпе или нажатии на TabBar не было видно углов контейнера
          child: Theme(
            data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                  ),
                  child: TabBar(
                    controller: tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      color: activeTab,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: textWantToVisit,
                      ),
                      Tab(
                        text: textVisited,
                      ),
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
        ),
        bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 1),
      );
}

// class CustomTabIndicator extends StatelessWidget {
//   TabController tabController;

//   CustomTabIndicator({
//     Key? key,
//     required this.tabController,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           for (int i = 0; i < tabController.length; i++)
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: Container(
//                 // height: 48,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(Radius.circular(12)),
//                   // color: buildRouteButton,
//                   color: tabController.index == i ? activeTab : notActiveTab,
//                 ),
//                 width: 164,
//                 height: 40,
//               ),
//             )
//         ],
//       );
// }
