import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/componants/CircularProgressIndicator_dailog.dart';
import 'package:whatsapp_app/componants/custom_elevated_btn.dart';

class otp_screen extends StatefulWidget {
  const otp_screen({super.key});

  @override
  State<otp_screen> createState() => _otp_screenState();
}

class _otp_screenState extends State<otp_screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool invalidOtp = false;
  bool isLoading = false;
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Stack(children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Code has been send to +1 111******99",
                        style: GetTextTheme.fs14_regular),
                    Gap(20),
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      textStyle: GetTextTheme.fs16_regular
                          .copyWith(color: AppColors.blackColor),
                      autoFocus: true,
                      enableActiveFill: true,
                      showCursor: false,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldHeight: 42,
                          fieldWidth: 60,
                          selectedColor: AppColors.blackColor,
                          activeColor: AppColors.grey,
                          disabledColor: AppColors.blackColor,
                          inactiveColor: AppColors.grey,
                          selectedFillColor: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          activeFillColor: AppColors.whiteColor,
                          inactiveFillColor: AppColors.whiteColor),
                      onChanged: (pin) {
                        print(pin);
                      },
                      onCompleted: (pin) {
                        Navigator.pushNamed(context, Routesname.home_page);
                      },
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
                    Gap(20),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Resend code in ",
                          style: GetTextTheme.fs14_regular),
                      TextSpan(
                          text: "56s",
                          style: GetTextTheme.fs12_regular.copyWith(
                            color: AppColors.green,
                          ))
                    ])),
                    Gap(100),
                    CustomElevatedButton(
                      btnName: "Verify",
                      onTap: () {
                        // if (_formKey.currentState!.validate()) {}
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
                      },
                      color: AppColors.blackColor,
                      foreground_clr: AppColors.whiteColor,
                    ),
                    Gap(40),
                  ],
                ),
              ),
              isLoading ? MyDialog() : SizedBox()
            ]),
          ),
        ),
      ),
    );
  }
}
