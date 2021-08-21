import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';
import 'package:places_yakimova_project/mocks.dart';

import 'const/colors.dart';
import 'const/values.dart';

class SightDetailsScreen extends StatefulWidget {
  const SightDetailsScreen({Key? key, required this.sight}) : super(key: key);

  final Sight sight;

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  // final titleText = 'Cписок интересных мест';
  static const textTimeWork = 'закрыто до 09:00';
  static const buildRroute = 'ПОСТРОИТЬ МАРШРУТ';
  static const toSchedule = 'Запланировать';
  static const favorites = 'В избранное';

  final mapSightTypeToString = {
    SightType.other: 'другое',
    SightType.cafe: 'кафе',
    SightType.hotel: 'отель',
    SightType.museum: 'музей',
    SightType.park: 'парк',
    SightType.restaurant: 'ресторан',
  };

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.sight.urls[0],
                    fit: BoxFit.cover,
                    height: 360, //обрежет и заполнит пространство
                  ),
                  Positioned(
                    left: standardSpacing,
                    top: MediaQuery.of(context).padding.top + 16,
                    child: Container(
                      width: standartSizeIndent,
                      height: standartSizeIndent,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: SvgPicture.asset('res/image/backArrow.svg'),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(standardSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.sight.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: standrtSizedBox),
                    Row(
                      children: [
                        Text(
                          mapSightTypeToString[widget.sight.type]!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: standardSpacing),
                        const Text(
                          textTimeWork,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: standardSpacingTextGalery),
                    Text(
                      widget.sight.details,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: standardSpacingTextGalery),
                    Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(standardSpacing),
                            child: Container(
                              height: 48,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: buildRouteButton, //Colors.green,
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 83),
                                  SvgPicture.asset('res/image/route.svg'),
                                  const SizedBox(width: 10),
                                  const Text(
                                    buildRroute,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: standardSpacingTextGalery),
                    Container(
                      height: 0.8,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          child: Row(
                            children: [
                              const SizedBox(width: standartSizeIndent),
                              SvgPicture.asset('res/image/theCalendar.svg'),
                              const SizedBox(width: 9),
                              const Text(
                                toSchedule,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 200,
                          child: Positioned(
                            left: 17,
                            child: Row(
                              children: [
                                SvgPicture.asset('res/image/likeBlack.svg'),
                                const SizedBox(width: 9),
                                const Text(
                                  favorites,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
