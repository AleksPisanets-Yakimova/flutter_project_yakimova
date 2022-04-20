import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'package:places_yakimova_project/main.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';
import 'package:places_yakimova_project/ui/screen/const/styles.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';
import 'package:places_yakimova_project/ui/screen/rez/my_theme_data.dart';

class SightCardFavoritePlace extends StatelessWidget {
  const SightCardFavoritePlace({
    Key? key,
    required this.sight,
    required this.visited,
  }) : super(key: key);

  final Sight sight;
  final bool visited;

  @override
  Widget build(BuildContext context) {
    final theme = MyApp.themeOf(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.standartSpacingZero,
        right: AppSizes.standartSpacingZero,
        top: AppSizes.standartSpacingTextGalery,
      ),
      child: _ContentCard(
        theme: theme,
        sight: sight,
        visited: visited,
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  const _ContentCard({
    Key? key,
    required this.theme,
    required this.sight,
    required this.visited,
  }) : super(key: key);

  final MyThemeData theme;
  final Sight sight;
  final bool visited;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(AppSizes.standartSpacing)),
          color: theme.colorDecoration,
        ),
        clipBehavior: Clip.antiAlias,
        child: AspectRatio(
          aspectRatio: 6 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _ImageAndItsParameters(
                  sight: sight,
                  visited: true,
                  color: theme.colorTextSightCategory),
              _CardOptions(
                sightName: sight.name,
                visited: visited,
                color: theme.colorTextTimePlan,
              )
            ],
          ),
        ),
      );
}

class _ImageAndItsParameters extends StatelessWidget {
  const _ImageAndItsParameters({
    Key? key,
    required this.sight,
    required this.visited,
    required this.color,
  }) : super(key: key);

  final Sight sight;
  final bool visited;
  final Color color;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                sight.urls[0],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) =>
                    progress == null ? child : const LinearProgressIndicator(),
              ),
            ),
            Positioned(
              left: AppSizes.standartSpacing,
              top: AppSizes.standartSpacing,
              child: Text(
                mapSightTypeToString[sight.type]!,
                style: AppTypography.textSightListCategory.withColor(color),
              ),
            ),
            Positioned(
              right: AppSizes.standartSpacing,
              top: AppSizes.standartSpacing,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (visited == true)
                    SvgPicture.asset(AppAssets.calendarWhiteSvg)
                  else
                    SvgPicture.asset(AppAssets.shareSvg),
                  const SizedBox(width: AppSizes.standartSizeBox),
                  SvgPicture.asset(AppAssets.outputSvg),
                ],
              ),
            ),
          ],
        ),
      );
}

class _CardOptions extends StatelessWidget {
  const _CardOptions({
    Key? key,
    required this.sightName,
    required this.visited,
    required this.color,
  }) : super(key: key);

  final String sightName;
  final bool visited;
  final Color color;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.standartSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                sightName,
                style: AppTypography.textSightListName,
              ),
              const SizedBox(height: AppSizes.standartSizedBox),
              if (visited)
                Expanded(
                  child: Text(
                    AppTexts.textTimePlan,
                    style: AppTypography.textSightListTimeWork.withColor(color),
                  ),
                ),
              const SizedBox(height: AppSizes.standartSizedBox),
              Expanded(
                child: Text(
                  AppTexts.textTimeWork,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      );
}