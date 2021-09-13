import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'const/colors.dart';
import 'const/values.dart';

class SightCard extends StatelessWidget {
  const SightCard({
    Key? key,
    required this.sight,
  }) : super(key: key);

  final Sight sight;
  static const titleTextLike = 'Like';

  static const mapSightTypeToString = {
    SightType.other: 'другое',
    SightType.cafe: 'кафе',
    SightType.hotel: 'отель',
    SightType.museum: 'музей',
    SightType.park: 'парк',
    SightType.restaurant: 'ресторан',
  };

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
                          fit: BoxFit.fitWidth,
                          loadingBuilder: (context, child, progress) =>
                              progress == null
                                  ? child
                                  : const LinearProgressIndicator(),
                          //BoxFit.cover, //обрежет и заполнит пространство
                        ),
                      ),
                      Positioned(
                        left: standardSpacing,
                        top: standardSpacing,
                        child: Text(
                          mapSightTypeToString[sight.type]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        right: standardSpacing,
                        top: standardSpacing,
                        child: SvgPicture.asset('res/image/like.svg'),
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
                        const SizedBox(height: standrtSizedBox),
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
