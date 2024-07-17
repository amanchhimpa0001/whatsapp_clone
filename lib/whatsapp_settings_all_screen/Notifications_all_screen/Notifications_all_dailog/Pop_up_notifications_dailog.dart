import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class Pop_up_notifications_dailog extends StatefulWidget {
  const Pop_up_notifications_dailog({super.key});

  @override
  State<Pop_up_notifications_dailog> createState() =>
      _Pop_up_notifications_dailogState();
}

class _Pop_up_notifications_dailogState
    extends State<Pop_up_notifications_dailog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(left: 20, right: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appservices.addheight(10),
            Text(
              "Popup notifications are no longer avilable in your version of Android",
              style: GetTextTheme.fs14_medium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Appservices.goback(context);
                    },
                    child: Text(
                      "LEARN MORE",
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
