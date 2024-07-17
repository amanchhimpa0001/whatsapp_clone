import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/all_image.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  int state = 0;

  // late Timer timer;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    // timer = Timer(Duration(milliseconds: 2000), () {
    //   if (state == 3) {
    //     timer.cancel();
    //   } else {
    //     setState(() {
    //       state++;
    //     });
    //   }
    // });
    await Future.delayed(
        Duration(milliseconds: 2000), () => setState(() => state = 1));
    await Future.delayed(
        Duration(milliseconds: 3000), () => setState(() => state = 2));
    await Future.delayed(Duration(milliseconds: 4000),
        () => Navigator.of(context).pushNamed(Routesname.Welcome_page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(Getimage.backgraoundimg),
      )),
      child: SafeArea(
        child: state == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(tag: "logo", child: Image.asset(Getimage.whatsapplogo)),
                ],
              )
            : state == 1
                ? Column(
                    children: [
                      Expanded(child: SizedBox()),
                      Hero(
                        tag: "logo",
                        child: Column(
                          children: [
                            Image.asset(
                              Getimage.whatsapplogo,
                              scale: 2,
                            ),
                            Gap(10.h),
                            Text("WhatsApp", style: GetTextTheme.fs20_medium),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text("from", style: GetTextTheme.fs10_regular),
                      Text("FACEBOOK", style: GetTextTheme.fs14_regular),
                      Gap(40)
                    ],
                  )
                : Column(
                    children: [
                      Expanded(child: SizedBox()),
                      Hero(
                          tag: "logo",
                          child: Column(
                            children: [
                              Image.asset(
                                Getimage.whatsapplogo,
                                scale: 2,
                              ),
                              Gap(30.h),
                              Text("WhatsApp", style: GetTextTheme.fs26_medium),
                            ],
                          )),
                      Expanded(child: SizedBox()),
                      CircularProgressIndicator(
                        color: AppColors.green,
                      ),
                      Gap(20),
                      Text("Loading...",
                          style: GetTextTheme.fs18_medium
                              .copyWith(color: AppColors.green)),
                      Gap(40),
                    ],
                  ),
      ),
    ));
  }
}
