import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class Archive_all_chats_dailog extends StatelessWidget {
  const Archive_all_chats_dailog({super.key});

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
              "Are you sure you want to archive ALL chats?",
              style: GetTextTheme.fs14_medium,
            ),
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
                      "OK",
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
