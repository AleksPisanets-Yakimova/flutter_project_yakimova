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
        // clipBehavior: Clip.antiAlias,
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
                        fit: BoxFit.fitWidth,
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
                        style: AppTypography.textSightListCategory
                            .withColor(theme.colorTextSightCategory),
                      ),
                    ),
                    Positioned(
                      right: AppSizes.standartSpacing,
                      top: AppSizes.standartSpacing,
                      child: SvgPicture.asset(AppAssets.likeWhiteSvg),
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
                          style: AppTypography.textSightListName
                              .withColor(theme.colorTextTitle),
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
