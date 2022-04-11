import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';

import 'package:places_yakimova_project/ui/screen/const/colors.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';

class SightDetailsScreen extends StatefulWidget {
  const SightDetailsScreen({Key? key, required this.sight}) : super(key: key);

  final Sight sight;

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.colorBlack,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.sight.urls.first, //widget.sight.urls[0],
                    fit: BoxFit.cover,
                    height: AppSizes
                        .standartHightImage, //обрежет и заполнит пространство
                  ),
                  Positioned(
                    left: AppSizes.standartSpacing,
                    top: MediaQuery.of(context).padding.top +
                        AppSizes.standartSpacing,
                    child: Container(
                      width: AppSizes.standartSizeIndent,
                      height: AppSizes.standartSizeIndent,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppSizes.standartRadius)),
                        color: AppColors.colorBlack, //lmColorText,
                      ),
                      child: Center(
                        child: SvgPicture.asset(AppAssets.backArrowSvg,
                            color: AppColors.colorWhite),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(AppSizes.standartSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.sight.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: AppSizes.standartSizedBox),
                    Row(
                      children: [
                        Text(
                          mapSightTypeToString[widget.sight.type]!,
                          style: const TextStyle(
                            color:
                                AppColors.colorSlateBlue, //Color(0xFF7C7E92),
                            fontSize: AppSizes.standartTextSize,
                          ),
                        ),
                        const SizedBox(width: AppSizes.standartSpacing),
                        const Text(
                          AppTexts.textTimeWork,
                          style: TextStyle(
                            color:
                                AppColors.colorSlateBlue, //Color(0xFF7C7E92),
                            fontSize: AppSizes.standartTextSize,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.standartSpacingTextGalery),
                    Text(
                      widget.sight.details,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: AppSizes.standartSpacingTextGalery),
                    Stack(
                      children: [
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.all(AppSizes.standartSpacing),
                            child: Container(
                              height: AppSizes.standartHeight_1,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: AppColors
                                    .colorMediumSeaGreen, //Colors.green,
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: AppSizes.standartWidth),
                                  SvgPicture.asset(AppAssets.routeSvg),
                                  const SizedBox(
                                      width: AppSizes.standartWidth_1),
                                  const Text(
                                    AppTexts.textBuildRroute,
                                    style: TextStyle(
                                        color: AppColors.colorWhite,
                                        fontSize: AppSizes.standartTextSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.standartSpacingTextGalery),
                    Container(
                      height: AppSizes.standartHeight_3,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppSizes.standartRadius_1)),
                        color: AppColors.colorSlateBlue, //Colors.grey,
                      ),
                    ),
                    const SizedBox(height: AppSizes.standartHeight_2),
                    Row(
                      children: [
                        SizedBox(
                          height: AppSizes.standartHeight,
                          width: AppSizes.standartWidth_2,
                          child: Row(
                            children: [
                              const SizedBox(
                                  width: AppSizes.standartSizeIndent),
                              SvgPicture.asset(AppAssets.calendarSvg),
                              const SizedBox(width: AppSizes.standartWidth_3),
                              const Text(
                                AppTexts.textToSchedule,
                                style: TextStyle(
                                  color:
                                      AppColors.colorSlateBlue, //Colors.grey,
                                  fontSize: AppSizes.standartTextSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.standartHeight,
                          width: AppSizes.standartWidth_2,
                          child: Positioned(
                            left: AppSizes.standartSpacing_1,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.heartFullSvg,
                                  color:
                                      AppColors.colorWhite, //selectedItemColor,
                                ),
                                const SizedBox(width: AppSizes.standartWidth_3),
                                const Text(
                                  AppTexts.textToFavorites,
                                  style: TextStyle(
                                    color: AppColors.colorWhite,
                                    fontSize: AppSizes.standartTextSize,
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
