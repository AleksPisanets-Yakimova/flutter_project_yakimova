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
    return BottomNavigationBar(
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (currentIndex) {},
      items: [
        BottomNavigationBarItem(
          icon: currentIndex == 0
              ? SvgPicture.asset(
                  AppAssets.listFullSvg,
                  color: Theme.of(context).navigationBarTheme.indicatorColor,
                )
              : SvgPicture.asset(
                  AppAssets.listSvg,
                  color: Theme.of(context).navigationBarTheme.backgroundColor,
                ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? SvgPicture.asset(
                  AppAssets.heartFullSvg,
                  color: Theme.of(context).navigationBarTheme.backgroundColor,
                )
              : SvgPicture.asset(
                  AppAssets.likeBlackSvg,
                  color: Theme.of(context).navigationBarTheme.indicatorColor,
                ),
          label: '',
        ),
      ],
    );
  }
}
