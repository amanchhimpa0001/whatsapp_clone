import 'package:flutter/material.dart';

import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  String btnName;
  Function onTap;
  Color? color;

  Color foreground_clr;
  Color? Borderclour;

  double padding;

  CustomElevatedButton(
      {required this.btnName,
      required this.onTap,
      this.color,
      this.foreground_clr = AppColors.blackColor,
      this.Borderclour,
      this.padding = 10,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                    horizontal: padding,
                  )),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  shadowColor: MaterialStateProperty.all(Borderclour),
                  backgroundColor: MaterialStateProperty.all(
                      color ?? AppColors.primaryColor),
                  foregroundColor: MaterialStateProperty.all(foreground_clr)),
              onPressed: () => onTap(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    btnName,
                    style: GetTextTheme.fs14_regular,
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        )
      ],
    );
  }
}
