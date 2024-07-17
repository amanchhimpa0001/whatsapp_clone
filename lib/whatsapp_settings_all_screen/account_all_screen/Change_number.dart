import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/text_btn.dart';

class Change_number extends StatelessWidget {
  const Change_number({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(30),
                Image.asset(Getimage.addsecurty),
                Gap(10),
                Text(
                  "For added security, enable two-step verification, which will require a PIN when registering your phone number with WhatsApp again.",
                  style:
                      GetTextTheme.fs14_regular.copyWith(color: AppColors.grey),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: SizedBox()),
                Text_btn(
                  txt: "ENABLE",
                  ontap: () {},
                  btnColor: AppColors.green,
                  txtColor: AppColors.whiteColor,
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
