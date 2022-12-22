import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places_yakimova_project/main.dart';
import 'package:places_yakimova_project/ui/screen/const/assets.dart';
import 'package:places_yakimova_project/ui/screen/const/value_text.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';
import 'package:places_yakimova_project/ui/screen/my_bottom_navigation_bar.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              AppTexts.textSettings,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSizes.standartSpacing),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    AppTexts.textSettingsTheme,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const Spacer(),
                  const _SwitchTheme(),
                ],
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () => print('Нажали на туториал'),
                child: Row(
                  children: [
                    Text(
                      AppTexts.textSettingsInfo,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      AppAssets.infoSvg,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 2),
      );
}

class _SwitchTheme extends StatefulWidget {
  const _SwitchTheme({Key? key}) : super(key: key);

  @override
  State<_SwitchTheme> createState() => _SwitchThemeState();
}

class _SwitchThemeState extends State<_SwitchTheme> {
  bool dark = true;

  @override
  Widget build(BuildContext context) => Switch(
        value: dark,
        activeColor: Colors.black,
        onChanged: (value) {
          print('Сменили тему');
          MyApp.of(context).toogleTheme();
          setState(
            () {
              dark = value;
            },
          );
        },
      );
}
