import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class Starrred_Messages extends StatelessWidget {
  const Starrred_Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Starred messages",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SizedBox(
        width: AppConfig.screenWidth,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.green),
                child: Icon(
                  Icons.star,
                  color: AppColors.whiteColor,
                  size: 60,
                ),
              ),
              Gap(10),
              Text(
                "Tap and hold on any message\nin any chat to star it, so you\ncan easily find it later.",
                style: GetTextTheme.fs14_regular,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
