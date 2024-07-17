import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/custom_elevated_btn.dart';

class New_payment_screen extends StatelessWidget {
  const New_payment_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Payments", style: GetTextTheme.fs16_medium),
                Gap(20),
                Image.asset(Getimage.newpayment),
                Gap(20),
                Text(
                  "Send and recieve money securely, right where you chat",
                  textAlign: TextAlign.center,
                  style: GetTextTheme.fs20_medium,
                ),
                Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.people,
                      color: AppColors.green,
                    ),
                    Gap(20),
                    Text(
                        "Crores of people are already using payments\non whatsApp.",
                        style: GetTextTheme.fs14_regular)
                  ],
                ),
                Gap(300),
                CustomElevatedButton(
                  btnName: "CONTINUE",
                  onTap: () {},
                  color: AppColors.green,
                  foreground_clr: AppColors.whiteColor,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(Getimage.bhimimg),
                  Image.asset(Getimage.upiIMG),
                  Gap(0),
                ])
              ],
            ),
          ),
        ),
      ));
    });
  }
}
