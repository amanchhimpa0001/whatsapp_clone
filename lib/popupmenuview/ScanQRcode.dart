import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/custom_elevated_btn.dart';

class ScanQRcode_screen extends StatelessWidget {
  const ScanQRcode_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Scan QR code",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            width: AppConfig.screenWidth,
            decoration: BoxDecoration(color: AppColors.lightgrey),
            child: Text(
              'To use WhatsApp web, go to\nweb.whatsapp.com on your computer.',
              style: GetTextTheme.fs16_regular.copyWith(color: AppColors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Gap(100),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
                padding: EdgeInsets.all(30),
                // padding:
                //     EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                width: AppConfig.screenWidth,
                decoration: BoxDecoration(color: AppColors.lightgrey),
                child: Column(
                  children: [
                    Image.asset(Getimage.code),
                    Gap(10),
                    CustomElevatedButton(
                      btnName: "OK",
                      onTap: () {},
                      color: AppColors.green,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
