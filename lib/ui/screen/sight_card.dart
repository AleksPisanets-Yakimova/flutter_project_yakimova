import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'package:places_yakimova_project/main.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';
import 'package:places_yakimova_project/ui/screen/const/styles.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';

class SightCard extends StatelessWidget {
  const SightCard({
    Key? key,
    required this.sight,
  }) : super(key: key);

  final Sight sight;

  SightType? get titleText => null;
  @override
  Widget build(BuildContext context) {
    final theme = MyApp.themeOf(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.standartSpacing,
        right: AppSizes.standartSpacing,
        top: AppSizes.standartSpacing,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(AppSizes.standartSpacing)),
          color: theme.colorDecoration,
        ),
        child: AspectRatio(
          aspectRatio: 6 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _ImageCard(
                image: sight.urls[0],
                type: mapSightTypeToString[sight.type]!,
                colorCard: theme.colorTextSightCategory,
              ),
              _DescriptionCard(
                name: sight.name,
                colorText: theme.colorTextTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<SightType>('titleText', titleText));
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({
    Key? key,
    required this.image,
    required this.type,
    required this.colorCard,
  }) : super(key: key);

  final String image;
  final String type;
  final Color colorCard;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
                loadingBuilder: (context, child, progress) =>
                    progress == null ? child : const LinearProgressIndicator(),
              ),
            ),
            Positioned(
              left: AppSizes.standartSpacing,
              top: AppSizes.standartSpacing,
              child: Text(
                type,
                style: AppTypography.textSightListCategory.withColor(colorCard),
              ),
            ),
            Positioned(
              right: AppSizes.standartSpacing,
              top: AppSizes.standartSpacing,
              child: SvgPicture.asset(AppAssets.likeWhiteSvg),
            ),
          ],
        ),
      );
}

class _DescriptionCard extends StatelessWidget {
  const _DescriptionCard({
    Key? key,
    required this.name,
    required this.colorText,
  }) : super(key: key);

  final String name;
  final Color colorText;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.standartSpacing),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              name,
              style: AppTypography.textSightListName.withColor(colorText),
            ),
            const SizedBox(height: AppSizes.standartSizedBox),
            const Expanded(
              child: Text(
                AppTexts.textTimeWork,
                style: AppTypography.textSightListTimeWork,
              ),
            ),
          ]),
        ),
      );
}
