import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_icons.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';

class Payments_screen extends StatelessWidget {
  const Payments_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.green,
          onPressed: () {
            Navigator.pushNamed(context, Routesname.New_peymants);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          icon: Image.asset(Appicons.payment),
          label: Text(
            "NEW PAYMENT",
            style:
                GetTextTheme.fs12_medium.copyWith(color: AppColors.whiteColor),
          )),
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Paymants",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              Text(
                'Histroy',
                style:
                    GetTextTheme.fs12_medium.copyWith(color: AppColors.green),
              ),
              Gap(20),
              Center(child: Image.asset(Getimage.history)),
              Gap(10),
              Center(
                child: Text(
                  'No payment history',
                  style:
                      GetTextTheme.fs12_regular.copyWith(color: AppColors.grey),
                ),
              ),
              Gap(20),
              Divider(
                thickness: 10,
              ),
              Gap(10),
              Text(
                'Payment method',
                style:
                    GetTextTheme.fs12_medium.copyWith(color: AppColors.green),
              ),
              ListTile(
                minVerticalPadding: 20,
                horizontalTitleGap: 30,
                visualDensity: VisualDensity(
                  horizontal: 3,
                ),
                onTap: () {},
                leading: Image.asset(Appicons.security),
                title: Text(
                  "To protect your security. WhatsApp does not store your upi pin or full bank account number.\nLearn more",
                  style:
                      GetTextTheme.fs14_regular.copyWith(color: AppColors.grey),
                ),
              ),
              Gap(20),
              ListTile(
                minVerticalPadding: 20,
                horizontalTitleGap: 30,
                visualDensity: VisualDensity(
                  horizontal: 3,
                ),
                onTap: () {},
                leading: Image.asset(Appicons.security),
                title: Text(
                  "Add payment method",
                  style: GetTextTheme.fs14_regular
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              Divider(
                thickness: 10,
              ),
              ListTile(
                minVerticalPadding: 20,
                horizontalTitleGap: 30,
                visualDensity: VisualDensity(
                  horizontal: 3,
                ),
                onTap: () {},
                leading: Image.asset(Appicons.help),
                title: Text(
                  "Help",
                  style: GetTextTheme.fs14_regular
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Getimage.bhimimg),
                  Image.asset(Getimage.upiIMG),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
