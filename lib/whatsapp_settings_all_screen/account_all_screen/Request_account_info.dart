import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/text_btn.dart';

class Request_account_info extends StatelessWidget {
  const Request_account_info({super.key});

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
                Center(child: Image.asset(Getimage.reportdata)),
                Gap(40),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text:
                            "Create a report of your WhatsApp account information and settings, which you can access or port to another app. This report does not include your messages.",
                        style: GetTextTheme.fs16_regular
                            .copyWith(color: AppColors.blackColor)),
                    TextSpan(
                        text: "Learn more",
                        style: GetTextTheme.fs14_regular.copyWith(
                          color: AppColors.blue,
                        ))
                  ])),
                ),
                Divider(),
                Gap(10),
                Row(
                  children: [
                    Icon(
                      Icons.sim_card,
                      color: AppColors.grey,
                    ),
                    Gap(20),
                    Text("Request report",
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.blackColor))
                  ],
                ),
                Gap(10),
                Divider(),
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
