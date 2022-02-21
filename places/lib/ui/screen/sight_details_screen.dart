import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';

import 'const/colors.dart';
import 'const/values.dart';

class SightDetailsScreen extends StatefulWidget {
  const SightDetailsScreen({Key? key, required this.sight}) : super(key: key);

  final Sight sight;

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: colorBlack,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.sight.urls.first, //widget.sight.urls[0],
                    fit: BoxFit.cover,
                    height:
                        standartHightImage, //обрежет и заполнит пространство
                  ),
                  Positioned(
                    left: standartSpacing,
                    top: MediaQuery.of(context).padding.top + standartSpacing,
                    child: Container(
                      width: standartSizeIndent,
                      height: standartSizeIndent,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(standartRadius)),
                        color: colorBlack, //lmColorText,
                      ),
                      child: Center(
                        child: SvgPicture.asset('res/image/back_arrow.svg',
                            color: colorWhite),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(standartSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.sight.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: standartSizedBox),
                    Row(
                      children: [
                        Text(
                          mapSightTypeToString[widget.sight.type]!,
                          style: const TextStyle(
                            color: colorSlateBlue, //Color(0xFF7C7E92),
                            fontSize: standartTextSize,
                          ),
                        ),
                        const SizedBox(width: standartSpacing),
                        const Text(
                          textTimeWork,
                          style: TextStyle(
                            color: colorSlateBlue, //Color(0xFF7C7E92),
                            fontSize: standartTextSize,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: standartSpacingTextGalery),
                    Text(
                      widget.sight.details,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: standartSpacingTextGalery),
                    Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(standartSpacing),
                            child: Container(
                              height: standartHeight_1,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: colorMediumSeaGreen, //Colors.green,
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: standartWidth),
                                  SvgPicture.asset('res/image/route.svg'),
                                  const SizedBox(width: standartWidth_1),
                                  const Text(
                                    textBuildRroute,
                                    style: TextStyle(
                                        color: colorWhite,
                                        fontSize: standartTextSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: standartSpacingTextGalery),
                    Container(
                      height: standartHeight_3,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(standartRadius_1)),
                        color: colorSlateBlue, //Colors.grey,
                      ),
                    ),
                    const SizedBox(height: standartHeight_2),
                    Row(
                      children: [
                        SizedBox(
                          height: standartHeight,
                          width: standartWidth_2,
                          child: Row(
                            children: [
                              const SizedBox(width: standartSizeIndent),
                              SvgPicture.asset('res/image/the_calendar.svg'),
                              const SizedBox(width: standartWidth_3),
                              const Text(
                                textToSchedule,
                                style: TextStyle(
                                  color: colorSlateBlue, //Colors.grey,
                                  fontSize: standartTextSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: standartHeight,
                          width: standartWidth_2,
                          child: Positioned(
                            left: standartSpacing_1,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'res/image/heart_full.svg',
                                  color: colorWhite, //selectedItemColor,
                                ),
                                const SizedBox(width: standartWidth_3),
                                const Text(
                                  textToFavorites,
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: standartTextSize,
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
