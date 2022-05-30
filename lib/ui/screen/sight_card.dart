import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'package:places_yakimova_project/ui/screen/const/assets.dart';
import 'package:places_yakimova_project/ui/screen/const/value_text.dart';
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
          color: Theme.of(context).colorScheme.background,
        ),
        child: AspectRatio(
          aspectRatio: 6 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _ImageCard(
                image: sight.urls[0],
                type: mapSightTypeToString[sight.type]!,
              ),
              _DescriptionCard(
                name: sight.name,
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
  }) : super(key: key);

  final String image;
  final String type;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.standartSpacing),
                    topRight: Radius.circular(
                      AppSizes.standartSpacing,
                    ),
                  ),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitWidth,
                  loadingBuilder: (context, child, progress) => progress == null
                      ? child
                      : const LinearProgressIndicator(),
                ),
              ),
            ),
            Positioned(
              child: FlatButton(
                  child: Text(
                    type,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  onPressed: () {
                    print('Тип карточки. Список интересных мест.');
                  }),
            ),
            Positioned(
              right: 0,
              child: FlatButton(
                  child: SvgPicture.asset(AppAssets.likeWhiteSvg),
                  onPressed: () {
                    print('Лайк. Список интересных мест.');
                  }),
            ),
          ],
        ),
      );
}

class _DescriptionCard extends StatelessWidget {
  const _DescriptionCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.standartSpacing),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: AppSizes.standartSizedBox),
            Expanded(
              child: Text(
                AppTexts.textTimeWork,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ]),
        ),
      );
}
