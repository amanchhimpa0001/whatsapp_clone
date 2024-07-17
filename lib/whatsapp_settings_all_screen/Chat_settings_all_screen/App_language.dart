import 'package:flutter/material.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';

class App_language extends StatefulWidget {
  const App_language({super.key});

  @override
  State<App_language> createState() => _App_languageState();
}

class _App_languageState extends State<App_language> {
  List<Languagefuction> Languagelist = [
    Languagefuction("English (US)", false),
    Languagefuction("Phone’s language (English)", false),
    Languagefuction("English (Uk)", false),
    Languagefuction("Hindi", false),
    Languagefuction("French", false),
    Languagefuction("Arabic", false),
    Languagefuction("Bengali", false),
    Languagefuction("Russian", false),
    Languagefuction("Indonesian", false),
    Languagefuction("Mandarin", false),
  ];

  String activeLanguage = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appservices.addheight(10),
            Text(
              "App Language",
              style: GetTextTheme.fs18_bold,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 1,
              ),
              shrinkWrap: true,
              itemCount: Languagelist.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Radio(
                      fillColor: MaterialStatePropertyAll(AppColors.green),
                      value: Languagelist[index].languagetittle,
                      groupValue: activeLanguage,
                      onChanged: (v) => setState(() {
                        activeLanguage = v!;
                      }),
                    ),
                    Text(
                      Languagelist[index].languagetittle,
                      style: GetTextTheme.fs16_regular,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Languagefuction {
  String languagetittle;
  bool isslect;
  Languagefuction(this.languagetittle, this.isslect);
}
