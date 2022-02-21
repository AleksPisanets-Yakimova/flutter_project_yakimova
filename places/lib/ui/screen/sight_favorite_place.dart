// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'const/colors.dart';
import 'const/values.dart';

class SightCardFavoritePlace extends StatelessWidget {
  const SightCardFavoritePlace({
    Key? key,
    required this.sight,
  }) : super(key: key);

  final Sight sight;

  SightType? get titleText => null;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: standartSpacingZero, //standardSpacing,
          right: standartSpacingZero, //standardSpacing,
          top: standartSpacingTextGalery,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(standartSpacing)),
            color: Theme.of(context)
                .cardTheme
                .color, //Theme.of(context).cardColor, //colorWhiteSmoke,
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
                        left: standartSpacing,
                        top: standartSpacing,
                        child: Text(
                          mapSightTypeToString[sight.type]!,
                          style: const TextStyle(
                            fontSize: standartTextSize,
                          ),
                        ),
                      ),
                      Positioned(
                        right: standartSpacing,
                        top: standartSpacing,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('res/image/calendar_white.svg'),
                            const SizedBox(width: standartSizeBox),
                            SvgPicture.asset('res/image/output.svg'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(standartSpacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          sight.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: standartSizedBox),
                        const Expanded(
                          child: Text(
                            textTimePlan,
                            style: TextStyle(
                              color: colorMediumSeaGreen,
                              fontSize: standartTextSize,
                            ),
                          ),
                        ),
                        const SizedBox(height: standartSizedBox),
                        Expanded(
                          child: Text(
                            textTimeWork,
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
