import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';
import 'package:whatsapp_app/Helpers/app_service.dart';
import 'package:whatsapp_app/Helpers/color_sheet.dart';
import 'package:whatsapp_app/Helpers/text_theme.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/authentication/conuntry_page.dart';
import 'package:whatsapp_app/authentication/otp.dart';

import 'package:whatsapp_app/componants/CircularProgressIndicator_dailog.dart';
import 'package:whatsapp_app/componants/text_btn.dart';
import 'package:whatsapp_app/controllers/ValidatioinController.dart';
import 'package:whatsapp_app/controllers/firebase_auth_controllers.dart';
import 'package:whatsapp_app/controllers/userdatacontrolller.dart';
import 'package:whatsapp_app/model/all_model.dart';
import 'package:whatsapp_app/model/country_model.dart';

class login_page extends StatefulWidget {
  const login_page({
    super.key,
  });
  static String verify = "";
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  CountryModel? countryModel;
  TextEditingController phn_controllers = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<dataservices>(context);
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter your phone number",
                          style: GetTextTheme.fs18_bold,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert_outlined))
                      ],
                    ),
                    Gap(20),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  "WhatsApp will need to verify your phone number",
                              style: GetTextTheme.fs12_regular
                                  .copyWith(color: AppColors.blackColor)),
                          TextSpan(
                              text: " . What’s my number?",
                              style: GetTextTheme.fs12_regular.copyWith(
                                color: AppColors.blue,
                              )),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(20),
                    countryCard(context),
                    Gap(20),
                    number(),
                    Gap(15),
                    Text(
                      " Carrier charges may apply",
                      style: GetTextTheme.fs10_regular,
                    ),
                    Expanded(child: SizedBox()),
                    Stack(children: [
                      Text_btn(
                          paddinghorizontal: 20,
                          txt: 'Next',
                          btnColor: AppColors.green,
                          txtColor: AppColors.blackColor,
                          ontap: () async {
                            print(provider
                                .adduserdata(usermodel(phn_controllers.text)));
                            // if (_formKey.currentState!.validate()) {
                            //   if (phn_controllers.text.length == 10) {
                            //     setState(() {
                            //       isLoading = true;
                            //     });

                            Future.delayed(Duration(seconds: 3), () {
                              Appservices.pushto(context, MyVerify());
                              // Navigator.pushNamed(
                              //     context, Routesname.otp_screen);
                              setState(() {
                                isLoading = false;
                              });
                            });
                            //   } else {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //         SnackBar(
                            //             content: Text(
                            //                 "Please enter correct number")));
                            //   }
                            // }
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '+91 8708540952',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                login_page.verify = verificationId;
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                            // showDialog(
                            //   context: context,
                            //   barrierDismissible: false,
                            //   builder: (BuildContext context) {
                            //     return MyDialog();
                            //   },
                            // );s
                            // FirebaseAuthController()
                            //     .sendOtp(phn_controllers.text);

                            // DatabaseController().addData();
                          }),
                    ]),
                    Gap(50),
                  ],
                ),
              ),
            ),
          ),
          isLoading ? MyDialog() : SizedBox()
        ],
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
      child: Container(
        width: AppConfig.screenWidth / 1.5,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: AppColors.green, width: 1.8))),
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
                      MaterialPageRoute(builder: (context) => Country_page()));
                  setState(() {});
                  // Navigator.pushNamed(
                  //   context,
                  //   Routesname.country_page,
                  // );
                },
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: AppColors.green,
                ))
          ],
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
                    bottom: BorderSide(color: AppColors.green, width: 1.7))),
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
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: AppColors.green, width: 1.8))),
            width: AppConfig.screenWidth / 1.6 - 100,
            child: TextFormField(
              maxLength: 10,
              validator: (value) => TextValidatioinController.isNumber(value),
              controller: phn_controllers,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Phone number"),
            ),
          )
        ],
      ),
    );
  }
}
