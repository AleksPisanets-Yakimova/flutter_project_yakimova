import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, //изменение размера и положения иконки снизу
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        currentIndex: currentIndex,
        onTap: (currentIndex) {},
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? SvgPicture.asset(
                    'res/image/list_full.svg',
                    color: Colors.black,
                  )
                : SvgPicture.asset(
                    'res/image/list.svg',
                    color: Colors.black,
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? SvgPicture.asset(
                    'res/image/like_black.svg',
                    color: Colors.black,
                  )
                : SvgPicture.asset(
                    'res/image/heart_full.svg',
                    color: Colors.black,
                  ),
            label: '',
          ),
        ],
      );
}
