import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places_yakimova_project/ui/screen/const/assets.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType
          .fixed, //изменение размера и положения иконки снизу
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (currentIndex) {},
      items: [
        BottomNavigationBarItem(
          icon: currentIndex == 0
              ? SvgPicture.asset(
                  AppAssets.listFullSvg,
                  color: theme.bottomNavigationBarTheme.unselectedItemColor,
                )
              : SvgPicture.asset(
                  AppAssets.listSvg,
                  color: theme.bottomNavigationBarTheme.selectedItemColor,
                ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? SvgPicture.asset(
                  AppAssets.heartFullSvg,
                  color: theme.bottomNavigationBarTheme.unselectedItemColor,
                )
              : SvgPicture.asset(
                  AppAssets.likeBlackSvg,
                  color: theme.bottomNavigationBarTheme.selectedItemColor,
                ),
          label: '',
        ),
      ],
    );
  }
}
