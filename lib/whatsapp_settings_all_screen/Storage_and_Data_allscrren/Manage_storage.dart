import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/componants/linear_indigator_listtile.dart';

class Manage_storage extends StatelessWidget {
  const Manage_storage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.green,
        title: Text(
          "Manage storage",
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "3.1",
                          style: GetTextTheme.fs24_regular.copyWith(
                            color: AppColors.green,
                          )),
                      TextSpan(
                          text: "MB",
                          style: GetTextTheme.fs18_regular.copyWith(
                            color: AppColors.green,
                          ))
                    ])),
                    // Gap(20),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "3.1",
                          style: GetTextTheme.fs24_regular.copyWith(
                            color: AppColors.green,
                          )),
                      TextSpan(
                          text: "MB",
                          style: GetTextTheme.fs18_regular.copyWith(
                            color: AppColors.green,
                          ))
                    ])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Used"),
                    Text("Free"),
                  ],
                ),
              ),
              Gap(30),
              new LinearPercentIndicator(
                barRadius: Radius.circular(10),
                width: Appservices.getScreenWidth(context),
                lineHeight: 12.0,
                percent: 0.7,
                backgroundColor: AppColors.grey,
                progressColor: AppColors.yellow,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "🟢 WhatsApp Media",
                      style: GetTextTheme.fs12_regular,
                    ),
                    Text(
                      "🟡 Apps and other items",
                      style: GetTextTheme.fs12_regular,
                    ),
                  ],
                ),
              ),
              Gap(20),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chats",
                      style: GetTextTheme.fs14_regular,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ],
                ),
              ),
              Gap(200),
              Center(
                child: Text(
                  "3 chats not displayed because they’re taking up a small amount of storage",
                  style:
                      GetTextTheme.fs14_regular.copyWith(color: AppColors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              // MyHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}
