import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (currentIndex) {},
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? TextButton(
                    onPressed: () {
                      print('Список интересных мест. BottomNavigationBar.');
                    },
                    child: SvgPicture.asset(
                      AppAssets.listFullSvg,
                      color:
                          Theme.of(context).navigationBarTheme.indicatorColor,
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      print('Список интересных мест. BottomNavigationBar.');
                    },
                    child: SvgPicture.asset(
                      AppAssets.listSvg,
                      color:
                          Theme.of(context).navigationBarTheme.backgroundColor,
                    ),
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? TextButton(
                    onPressed: () {
                      print('Избранное. BottomNavigationBar.');
                    },
                    child: SvgPicture.asset(
                      AppAssets.heartFullSvg,
                      color:
                          Theme.of(context).navigationBarTheme.backgroundColor,
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      print('Избранное. BottomNavigationBar.');
                    },
                    child: SvgPicture.asset(
                      AppAssets.likeBlackSvg,
                      color:
                          Theme.of(context).navigationBarTheme.indicatorColor,
                    ),
                  ),
            label: '',
          ),
        ],
      );
}
