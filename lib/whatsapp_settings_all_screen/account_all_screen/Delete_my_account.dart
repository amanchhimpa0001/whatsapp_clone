import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/authentication/conuntry_page.dart';
import 'package:whatsapp_app/componants/text_btn.dart';
import 'package:whatsapp_app/model/country_model.dart';

class Delete_my_account extends StatefulWidget {
  const Delete_my_account({super.key});

  @override
  State<Delete_my_account> createState() => _Delete_my_accountState();
}

class _Delete_my_accountState extends State<Delete_my_account> {
  CountryModel? countryModel;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                horizontalTitleGap: 30,
                onTap: () {},
                leading: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Icon(
                    Icons.warning,
                    color: AppColors.darkred,
                  ),
                ),
                title: Text(""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deleting your account will:",
                      style: GetTextTheme.fs14_regular
                          .copyWith(color: AppColors.darkred),
                    ),
                    Gap(5),
                    Text(
                      "• Delete your account from WhatsApp ",
                      style: GetTextTheme.fs10_regular
                          .copyWith(color: AppColors.greyColor),
                    ),
                    Text(
                      "• Erase your message history",
                      style: GetTextTheme.fs10_regular
                          .copyWith(color: AppColors.greyColor),
                    ),
                    Text(
                      "• Delete you from all of your WhatsApp groups",
                      style: GetTextTheme.fs10_regular
                          .copyWith(color: AppColors.greyColor),
                    ),
                    Text(
                      "• Delete your payments history and cancel any pending ",
                      style: GetTextTheme.fs10_regular
                          .copyWith(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Divider(color: AppColors.greyColor),
              ),
              Gap(20),
              ListTile(
                horizontalTitleGap: 30,
                onTap: () {},
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.exit_to_app_outlined,
                    ),
                  ],
                ),
                title: Text(
                  "Change number instead?",
                  style: GetTextTheme.fs14_regular,
                ),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text_btn(
                      maxWidth: 200,
                      paddinghorizontal: 25,
                      txt: 'CHANGE NUMBER',
                      btnColor: AppColors.green,
                      txtColor: AppColors.whiteColor,
                      ontap: () {},
                      padding: 13,
                    ),
                  ],
                ),
              ),
              Gap(20),
              Divider(color: AppColors.greyColor),
              Gap(20),
              Center(
                child: Text(
                  "To delete your account, confirm your country\ncode and enter your phone number.",
                  style: GetTextTheme.fs12_regular
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "Country",
                  style: GetTextTheme.fs10_regular,
                ),
              ),
              Center(child: countryCard(context)),
              Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "Phone",
                  style: GetTextTheme.fs10_regular,
                ),
              ),
              Gap(10),
              Center(child: number()),
              Gap(15),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text_btn(
                    padding: 10,
                    paddinghorizontal: 20,
                    txt: 'DELETE MY ACCOUNT',
                    btnColor: AppColors.darkred,
                    txtColor: AppColors.whiteColor,
                    ontap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget countryCard(BuildContext context) {
    return InkWell(
      onTap: () async {
        countryModel = await Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Country_page()));
        setState(() {});
        // Navigator.pushNamed(context, Routesname.country_page);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Container(
          width: AppConfig.screenWidth / 1.1,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.greyscale, width: 1.8))),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      countryModel == null ? "India" : countryModel!.name,
                      style: GetTextTheme.fs14_regular,
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () async {
                    countryModel = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Country_page()));
                    setState(() {});
                    // Navigator.pushNamed(
                    //   context,
                    //   Routesname.country_page,
                    // );
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: AppColors.greyscale,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget number() {
    return Container(
      width: AppConfig.screenWidth / 1.4,
      height: 38,
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: AppColors.greyscale, width: 1.7))),
            child: Row(
              children: [
                Text(
                  countryModel == null ? "🇮🇳" : countryModel!.flag,
                  style: GetTextTheme.fs18_regular,
                ),
                Gap(20),
                Text(
                  countryModel == null ? '+91' : countryModel!.code,
                  style: GetTextTheme.fs15_extrabold,
                )
              ],
            ),
          ),
          Gap(30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: AppColors.greyscale, width: 1.8))),
              width: AppConfig.screenWidth,
              child: TextFormField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                    hintText: "Phone number"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
