import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class Clear_all_chats_dailog extends StatefulWidget {
  const Clear_all_chats_dailog({super.key});

  @override
  State<Clear_all_chats_dailog> createState() => _Clear_all_chats_dailogState();
}

class _Clear_all_chats_dailogState extends State<Clear_all_chats_dailog> {
  var isChecked = true;
  var isChecked2 = true;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15),
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
              "Clear massages in chats?",
              style: GetTextTheme.fs18_medium,
            ),
            Gap(10),
            Text(
              "Massages in all chats will disappear foreever.",
              style: GetTextTheme.fs13_regular,
            ),
            CheckboxListTile.adaptive(
              autofocus: false,
              activeColor: AppColors.green,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              visualDensity: VisualDensity(horizontal: -4),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "Delete media in chats",
                style: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.greyscale),
              ),
              value: isChecked,
              onChanged: (value) => setState(() {
                isChecked = value!;
              }),
            ),
            CheckboxListTile(
              autofocus: false,
              activeColor: AppColors.green,
              checkColor: Colors.white,
              // side: BorderSide(color: AppColors.green),
              // fillColor: MaterialStateProperty.all(AppColors.green),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              visualDensity: VisualDensity(horizontal: -4),
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "Delete starred messages",
                style: GetTextTheme.fs13_regular
                    .copyWith(color: AppColors.greyscale),
              ),
              value: isChecked2,
              onChanged: (value) => setState(() {
                isChecked2 = value!;
              }),
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
                      "CLEAR MASSAGES",
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
