import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_yakimova_project/domain/sight.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';

import 'package:places_yakimova_project/ui/screen/const/colors.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';

class SightDetailsScreen extends StatefulWidget {
  const SightDetailsScreen({
    Key? key,
    required this.sight,
  }) : super(key: key);

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
              _Image(image: widget.sight.urls.first),
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
                    _TypeCard(type: mapSightTypeToString[widget.sight.type]!),
                    const SizedBox(height: AppSizes.standartSpacingTextGalery),
                    Text(
                      widget.sight.details,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: AppSizes.standartSpacingTextGalery),
                    _ButtonRoute(),
                    const SizedBox(height: AppSizes.standartSpacingTextGalery),
                    _DividingLine(),
                    const SizedBox(height: AppSizes.standartHeight_2),
                    _FooterButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Image.network(
            image,
            fit: BoxFit.cover,
            height: AppSizes.standartHightImage,
          ),
          Positioned(
            left: AppSizes.standartSpacing,
            top: MediaQuery.of(context).padding.top + AppSizes.standartSpacing,
            child: Container(
              width: AppSizes.standartSizeIndent,
              height: AppSizes.standartSizeIndent,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppSizes.standartRadius)),
                color: AppColors.colorBlack,
              ),
              child: Center(
                child: SvgPicture.asset(AppAssets.backArrowSvg,
                    color: AppColors.colorWhite),
              ),
            ),
          )
        ],
      );
}

class _TypeCard extends StatelessWidget {
  const _TypeCard({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            type,
            style: const TextStyle(
              color: AppColors.colorSlateBlue,
              fontSize: AppSizes.standartTextSize,
            ),
          ),
          const SizedBox(width: AppSizes.standartSpacing),
          const Text(
            AppTexts.textTimeWork,
            style: TextStyle(
              color: AppColors.colorSlateBlue,
              fontSize: AppSizes.standartTextSize,
            ),
          ),
        ],
      );
}

class _ButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.standartSpacing),
              child: Container(
                height: AppSizes.standartHeight_1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: AppColors.colorMediumSeaGreen,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: AppSizes.standartWidth),
                    SvgPicture.asset(AppAssets.routeSvg),
                    const SizedBox(width: AppSizes.standartWidth_1),
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
      );
}

class _DividingLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: AppSizes.standartHeight_3,
        decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(AppSizes.standartRadius_1)),
          color: AppColors.colorSlateBlue,
        ),
      );
}

class _FooterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(child: _ButtonPlan()),
          Expanded(child: _ButtonFavorites()),
        ],
      );
}

class _ButtonPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppSizes.standartHeight,
        width: AppSizes.standartWidth_2,
        child: Row(
          children: [
            const SizedBox(width: AppSizes.standartSizeIndent),
            SvgPicture.asset(AppAssets.calendarSvg),
            const SizedBox(width: AppSizes.standartWidth_3),
            const Text(
              AppTexts.textToSchedule,
              style: TextStyle(
                color: AppColors.colorSlateBlue,
                fontSize: AppSizes.standartTextSize,
              ),
            ),
          ],
        ),
      );
}

class _ButtonFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppSizes.standartHeight,
        width: AppSizes.standartWidth_2,
        child: Positioned(
          left: AppSizes.standartSpacing_1,
          child: Row(
            children: [
              SvgPicture.asset(
                AppAssets.heartFullSvg,
                color: AppColors.colorWhite,
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
      );
}
