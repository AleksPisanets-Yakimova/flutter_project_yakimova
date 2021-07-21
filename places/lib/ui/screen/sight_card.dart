import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'const/colors.dart';
import 'const/values.dart';

class SightCard extends StatelessWidget {
  const SightCard({
    Key? key,
    required this.sight,
  }) : super(key: key);

  final Sight sight;
  final titleTextLike = 'Like';

  SightType? get titleText => null;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: standardSpacing,
          right: standardSpacing,
          top: standardSpacing,
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(standardSpacing)),
            color: sightCardBackground,
          ),
          clipBehavior: Clip.antiAlias,
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          sight.urls[0],
                          fit: BoxFit.cover, //обрежет и заполнит пространство
                        ),
                      ),
                      Positioned(
                        left: standardSpacing,
                        top: standardSpacing,
                        child: Text(
                          sight.type,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        right: standardSpacing,
                        top: standardSpacing,
                        child: Text(
                          titleTextLike, //sight.type,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(standardSpacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          sight.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 2),
                        Expanded(
                          child: Text(
                            sight.details,
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
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<SightType>('titleText', titleText));
  }
}
