import 'package:flutter/material.dart';
import 'package:places_yakimova_project/ui/screen/const/values.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.imageButton,
    required this.textButton,
    required this.textPrint,
  }) : super(key: key);

  final String imageButton;
  final String textButton;
  final String textPrint;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Container(
          height: AppSizes.standartHeightBigger,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(AppSizes.standartRadiusBig)),
            color: Theme.of(context).buttonColor,
          ),
          child: Center(
            child: Text(
              textButton,
              style: Theme.of(context).textTheme.button,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onPressed: () {
          print(textPrint);
        });
  }
}
