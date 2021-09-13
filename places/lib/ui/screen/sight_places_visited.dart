import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'const/colors.dart';
import 'const/values.dart';

class SightCardPlaceVisited extends StatelessWidget {
  const SightCardPlaceVisited({
    Key? key,
    required this.sight,
  }) : super(key: key);

  final Sight sight;

  static const mapSightTypeToString = {
    SightType.other: 'другое',
    SightType.cafe: 'кафе',
    SightType.hotel: 'отель',
    SightType.museum: 'музей',
    SightType.park: 'парк',
    SightType.restaurant: 'ресторан',
  };

  static const textTimeWork = 'закрыто до 09:00';
  static const textTimePlan = 'Запланировано на 12 окт. 2021';

  SightType? get titleText => null;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 0, //standardSpacing,
          right: 0, //standardSpacing,
          top: 24,
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(standardSpacing)),
            color: sightCardBackground,
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
                          // BoxFit.cover, //обрежет и заполнит пространство
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset('res/image/calendarWhite.svg'),
                            const SizedBox(width: 23),
                            SvgPicture.asset('res/image/output.svg'),
                          ],
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
                        const SizedBox(height: standrtSizedBox),
                        const Expanded(
                          child: Text(
                            textTimePlan,
                            style: TextStyle(
                              color: buildRouteButton,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
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
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<SightType>('titleText', titleText));
  }
}
