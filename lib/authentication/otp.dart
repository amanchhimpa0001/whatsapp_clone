import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/authentication/login.dart';
import 'package:whatsapp_app/componants/custom_elevated_btn.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool invalidOtp = false;
  var code = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Code has been send to +1 111******99",
                      style: GetTextTheme.fs14_regular),
                  Gap(40),
                  Pinput(
                    onChanged: (value) {
                      code = value;
                    },
                    defaultPinTheme: PinTheme(
                        width: 80,
                        height: 68,
                        textStyle: GetTextTheme.fs26_regular,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.blackColor),
                            borderRadius: BorderRadius.circular(20))),
                    length: 6,
                    // defaultPinTheme: defaultPinTheme,
                    // focusedPinTheme: focusedPinTheme,
                    // submittedPinTheme: submittedPinTheme,

                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                  Gap(40),
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
                  CustomElevatedButton(
                    btnName: "Verify",
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {}
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: login_page.verify, smsCode: code);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                      Navigator.pushNamed(context, Routesname.home_page);
                      } catch (e) {
                        print("=============wrong otp");
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
