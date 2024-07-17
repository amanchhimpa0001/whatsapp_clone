import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/componants/custom_elevated_btn.dart';
import 'package:whatsapp_app/controllers/ValidatioinController.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  TextEditingController phn_controllers = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.tranceparent,
        title: Text(
          "Enter OTP Code",
          style: GetTextTheme.fs20_medium.copyWith(color: AppColors.blackColor),
        ),
        leading: IconButton(
            onPressed: () {
              Appservices.goback(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: AppColors.blackColor,
            )),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Code has been send to +1 111******99",
                        style: GetTextTheme.fs14_regular),
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myInputBox(context, txt1),
                      myInputBox(context, txt2),
                      myInputBox(context, txt3),
                      myInputBox(context, txt4),
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      invalidOtp
                          ? Icon(
                              Icons.error,
                              color: AppColors.darkred,
                            )
                          : SizedBox(),
                      Gap(10),
                      Text(
                        invalidOtp ? 'Invalid otp!' : '',
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.darkred),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text("Haven't received OTP yet?",
                  //         style: GetTextTheme.fs14_regular),
                  //     Gap(20),
                  //     resendTime == 0
                  //         ? InkWell(
                  //             onTap: () {
                  //               invalidOtp = false;
                  //               resendTime = 59;
                  //               startTimer();
                  //             },
                  //             child: Text(
                  //               'Resend',
                  //               style: GetTextTheme.fs14_regular
                  //                   .copyWith(color: AppColors.darkred),
                  //             ),
                  //           )
                  //         : SizedBox()
                  //   ],
                  // ),
                  // Gap(10),
                  // resendTime != 0
                  //     ? Center(
                  //         child: Text(
                  //           'You can resend OTP after ${strFormatting(resendTime)} second(s)',
                  //           style: GetTextTheme.fs14_regular,
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       )
                  //     : SizedBox(),
                  Gap(20),
                  Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Resend code in ",
                          style: GetTextTheme.fs14_regular),
                      TextSpan(
                          text: "56s",
                          style: GetTextTheme.fs12_regular.copyWith(
                            color: AppColors.green,
                          ))
                    ])),
                  ),
                  Gap(20),
                  CustomElevatedButton(
                    btnName: "Verify",
                    onTap: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   if (phn_controllers.text.length == 10) {
                      //     setState(() {
                      //       isLoading = true;
                      //     });

                      //     Future.delayed(Duration(seconds: 3), () {
                      //       Appservices.pushto(context, OTPPage());
                      //       setState(() {
                      //         isLoading = false;
                      //       });
                      //     });
                      //   } else {
                      //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //         content: Text("Please enter correct number")));
                      //   }
                      // }
                      final otp = txt1.text + txt2.text + txt3.text + txt4.text;
                      if (otp == '3333') {
                        stopTimer();
                        if (_formKey.currentState!.validate()) {
                          return Navigator.pushNamed(
                              context, Routesname.home_page);
                        }
                        // showDialog(
                        //     context: context,
                        //     builder: (context) => SimpleDialog(
                        //           insetPadding: EdgeInsets.only(
                        //               left: 10, right: 10, top: 10, bottom: 10),
                        //           children: [
                        //             Column(
                        //               children: [CircularProgressIndicator()],
                        //             )
                        //           ],
                        //         ));
                        // Future.delayed(
                        //     Duration(seconds: 2),
                        //     () => Navigator.pushNamed(
                        //         context, Routesname.home_page));
                      } else {
                        setState(() {
                          invalidOtp = true;
                        });
                      }
                    },
                    color: AppColors.blackColor,
                    foreground_clr: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 60,
    width: 70,
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: TextFormField(
      validator: (value) => TextValidatioinController.isTextValid(value),
      showCursor: false,
      controller: controller,
      maxLength: 1,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: GetTextTheme.fs35_regular,
      decoration: const InputDecoration(
        counterText: '',
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
