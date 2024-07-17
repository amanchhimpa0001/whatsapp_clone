import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';

import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

// ignore: must_be_immutable
class Text_btn extends StatelessWidget {
  String txt;
  Color btnColor, txtColor;
  Function ontap;
  double padding;
  double paddinghorizontal;
  double? maxWidth;
  Text_btn(
      {this.padding = 10,
      required this.txt,
      this.paddinghorizontal = 10,
      this.btnColor = AppColors.whiteColor,
      this.txtColor = AppColors.blue,
      required this.ontap,
      this.maxWidth,
      super.key});

  // bool backgroundColor = false, textcolur = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          ontap();
        },
        style: TextButton.styleFrom(
            maximumSize:
                Size(maxWidth ?? Appservices.getScreenWidth(context), 45),
            padding: EdgeInsets.symmetric(
                vertical: padding, horizontal: paddinghorizontal),
            foregroundColor: txtColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r)),
            backgroundColor: btnColor),
        child: Text(
          txt,
          style: GetTextTheme.fs14_bold,
        ));
  }
}
