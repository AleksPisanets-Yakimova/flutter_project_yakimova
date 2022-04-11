import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'package:places_yakimova_project/main.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';

class SightCardPlaceVisited extends StatelessWidget {
  const SightCardPlaceVisited({
    Key? key,
    required this.sight,
  }) : super(key: key);

  final Sight sight;

  SightType? get titleText => null;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.standartSpacingZero, //standardSpacing,
          right: AppSizes.standartSpacingZero, //standardSpacing,
          top: AppSizes.standartSpacingTextGalery,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(AppSizes.standartSpacing)),
            color: context
                .findRootAncestorStateOfType<MyAppState>()!
                .myTheme
                .colorDecoration, //colorWhiteSmoke, устаовить цвет в теме
          ),
          clipBehavior: Clip.antiAlias,
          child: AspectRatio(
            aspectRatio: 6 / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          sight.urls[0],
                          fit: BoxFit.cover, //fitWidth,
                          loadingBuilder: (context, child, progress) =>
                              progress == null
                                  ? child
                                  : const LinearProgressIndicator(),
                        ),
                      ),
                      Positioned(
                        left: AppSizes.standartSpacing,
                        top: AppSizes.standartSpacing,
                        child: Text(
                          mapSightTypeToString[sight.type]!,
                          style: const TextStyle(
                            fontSize: AppSizes.standartTextSize,
                          ),
                        ),
                      ),
                      Positioned(
                        right: AppSizes.standartSpacing,
                        top: AppSizes.standartSpacing,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AppAssets.shareSvg),
                            const SizedBox(width: AppSizes.standartSizeBox),
                            SvgPicture.asset(AppAssets.outputSvg),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.standartSpacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          sight.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: AppSizes.standartSizedBox),
                        const Expanded(
                          child: Text(
                            AppTexts.textTimePlan,
                            style: TextStyle(
                              fontSize: AppSizes.standartTextSize,
                            ),
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
                ),
              ],
            ),
          ),
        ),
      );
}
