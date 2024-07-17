import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/allaap_fix_data.dart';

class Help_screen extends StatelessWidget {
  const Help_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Chat history",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: Help_fix_data.helphistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    horizontalTitleGap: 30,
                    visualDensity: VisualDensity(
                      horizontal: 3,
                    ),
                    onTap: () {},
                    leading: Icon(Help_fix_data.helphistory[index]["icon"]),
                    title: Text(Help_fix_data.helphistory[index]["title"]),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
