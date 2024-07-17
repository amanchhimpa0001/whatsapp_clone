import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/text_btn.dart';

class Twostep_verification extends StatelessWidget {
  const Twostep_verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Security",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SizedBox(
        width: AppConfig.screenWidth,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(30),
                Center(child: Image.asset(Getimage.clonesim)),
                Gap(10),
                Text(
                  "Changing your phone number will migrate your account info, groups & settings.",
                  style: GetTextTheme.fs16_regular,
                  textAlign: TextAlign.center,
                ),
                Gap(10),
                Text(
                  "Before proceeding, please confirm that you are able to receive SMS or calls at your new number.",
                  style:
                      GetTextTheme.fs14_regular.copyWith(color: AppColors.grey),
                  textAlign: TextAlign.center,
                ),
                Gap(10),
                Text(
                  "If you have both a new phone & a new number, first change your number on your old phone.",
                  style:
                      GetTextTheme.fs14_regular.copyWith(color: AppColors.grey),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: SizedBox()),
                Center(
                  child: Text_btn(
                    txt: "Next",
                    ontap: () {},
                    btnColor: AppColors.green,
                    txtColor: AppColors.whiteColor,
                  ),
                ),
                Gap(40)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
