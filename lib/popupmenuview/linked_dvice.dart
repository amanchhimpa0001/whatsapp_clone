import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/custom_elevated_btn.dart';
import 'package:whatsapp_app/componants/listtile.dart';

class Link_devices extends StatelessWidget {
  const Link_devices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Linked devices",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SizedBox(
        width: AppConfig.screenWidth,
        child: SafeArea(
          child: Column(
            children: [
              Gap(20),
              Image.asset(Getimage.linked_devices),
              Gap(20),
              Text(
                "Use WhatsAPP on other devices",
                style: GetTextTheme.fs28_medium,
                textAlign: TextAlign.center,
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CustomElevatedButton(
                  foreground_clr: AppColors.whiteColor,
                  btnName: "LINK A DEVICE",
                  onTap: () {},
                  color: AppColors.green,
                ),
              ),
              Gap(20),
              Divider(
                thickness: 15,
              ),
              Gap(20),
              listtile(
                title: "Multi-device beta",
                icon: Appicons.multi,
                subtitle:
                    'Use up to 4 devices without keeping your phone online. Tap to learn more.',
              )
            ],
          ),
        ),
      ),
    );
  }
}
