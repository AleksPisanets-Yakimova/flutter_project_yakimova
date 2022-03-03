import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  'res/image/list_full.svg',
                  color: theme.bottomNavigationBarTheme.unselectedItemColor,
                )
              : SvgPicture.asset(
                  'res/image/list.svg',
                  color: theme.bottomNavigationBarTheme.selectedItemColor,
                ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? SvgPicture.asset(
                  'res/image/heart_full.svg',
                  color: theme.bottomNavigationBarTheme
                      .unselectedItemColor, //selectedItemColor,
                )
              : SvgPicture.asset(
                  'res/image/like_black.svg',
                  color: theme.bottomNavigationBarTheme
                      .selectedItemColor, //unselectedItemColor,
                ),
          label: '',
        ),
      ],
    );
  }
}
