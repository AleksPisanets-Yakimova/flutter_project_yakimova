import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import '../../main.dart';
import 'const/colors.dart';
import 'const/values.dart';

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
        left: standartSpacing,
        right: standartSpacing,
        top: standartSpacing,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(standartSpacing)),
          color: theme.colorDecoration, //colorWhiteS,
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
                        fit: BoxFit.fitWidth,
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
                          color: colorWhite,
                          fontSize: standartTextSize,
                        ),
                      ),
                    ),
                    Positioned(
                      right: standartSpacing,
                      top: standartSpacing,
                      child: SvgPicture.asset('res/image/like_white.svg'),
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
                            textTimeWork,
                            style: TextStyle(
                              color: colorNavyBlue, //Colors.grey,
                              fontSize: standartTextSize,
                            ),
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
