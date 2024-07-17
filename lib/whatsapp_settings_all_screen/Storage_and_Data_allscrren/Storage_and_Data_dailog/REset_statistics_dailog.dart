import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class REset_statistics_dailog extends StatelessWidget {
  const REset_statistics_dailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appservices.addheight(10),
            Text(
              "Reset network usage statistics?",
              style: GetTextTheme.fs14_medium,
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Appservices.goback(context);
                    },
                    child: Text(
                      "CANCAL",
                      style: TextStyle(color: AppColors.green),
                    )),
                TextButton(
                    onPressed: () {
                      Appservices.goback(context);
                    },
                    child: Text(
                      "RESET",
                      style: TextStyle(color: AppColors.green),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
