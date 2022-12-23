import 'package:flutter/material.dart';
import 'package:places_yakimova_project/mocks/mocks.dart';
import 'package:places_yakimova_project/ui/screen/const/value_text.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';
import 'package:places_yakimova_project/ui/screen/my_bottom_navigation_bar.dart';
import 'package:places_yakimova_project/ui/screen/sight_favorite_place.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: SingleChildScrollView(
          child: _Content(),
        ),
        bottomNavigationBar: MyBottomNavigationBar(currentIndex: 0),
      );
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            decoration: const BoxDecoration(),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.standartSpacing,
                right: AppSizes.standartSpacing,
                top: AppSizes.standartTop,
              ),
              child: Text(
                AppTexts.textTitle,
                style: Theme.of(context).textTheme.headline5,
                maxLines: 2,
              ),
            ),
          ),
          for (final sight in mocks)
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.standartSpacing,
                left: AppSizes.standartSpacing,
              ),
              child: SightCardFavoritePlace(
                sight: sight,
                visited: false,
                interestingPlaces: true,
              ),
            ),
          const SizedBox(height: AppSizes.standartSpacing),
        ],
      );
}
