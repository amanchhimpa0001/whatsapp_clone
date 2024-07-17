import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class Delete_all_chats_dailog extends StatefulWidget {
  const Delete_all_chats_dailog({super.key});

  @override
  State<Delete_all_chats_dailog> createState() =>
      _Delete_all_chats_dailogState();
}

class _Delete_all_chats_dailogState extends State<Delete_all_chats_dailog> {
  var isChecked = true;
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
              "Are you sure you want to delete All\nchtas and their massages?",
              style: GetTextTheme.fs14_regular,
            ),
            Gap(20),
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
                      "DELETE",
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
