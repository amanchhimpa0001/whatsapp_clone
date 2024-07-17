import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class Wallpaper_screen extends StatelessWidget {
  const Wallpaper_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Chats",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(70),
              Center(child: Image.asset(Getimage.contectname)),
              Gap(70),
              Center(
                child: Text(
                  "CHANGE",
                  style: GetTextTheme.fs16_regular
                      .copyWith(color: AppColors.green),
                ),
              ),
              Gap(20),
              Center(
                  child: Text(
                "To change your wallpaper for dark theme, turn on dark theme from settings >Chats> Theme.",
                style: GetTextTheme.fs12_regular
                    .copyWith(color: AppColors.greyColor),
                textAlign: TextAlign.center,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
