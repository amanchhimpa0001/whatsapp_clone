import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/componants/custom_elevated_btn.dart';

class Welcome_page extends StatelessWidget {
  const Welcome_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap(40),
            Text(
              "Welcome to WhatsApp",
              style: GetTextTheme.fs24_bold,
            ),
            Gap(60),
            Image.asset(Getimage.welcomeimg),
            Gap(40),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "Read our",
                      style: GetTextTheme.fs12_regular
                          .copyWith(color: AppColors.blackColor)),
                  TextSpan(
                      text: " Privacy Policy. ",
                      style: GetTextTheme.fs12_regular.copyWith(
                        color: AppColors.blue,
                      )),
                  TextSpan(
                      text: "Tap “Agree and continue” to\naccept the",
                      style: GetTextTheme.fs12_regular
                          .copyWith(color: AppColors.blackColor)),
                  TextSpan(
                      text: "Teams of Service.",
                      style: GetTextTheme.fs12_regular.copyWith(
                        color: AppColors.blue,
                      ))
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Gap(40),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CustomElevatedButton(
                color: AppColors.green,
                btnName: " AGREE AND CONTINUE",
                onTap: () {
                  Navigator.pushNamed(context, Routesname.login_page);
                },
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Text("from", style: GetTextTheme.fs10_regular),
            Text("FACEBOOK", style: GetTextTheme.fs14_regular),
            Gap(40),
          ],
        ),
      ),
    );
  }
}
