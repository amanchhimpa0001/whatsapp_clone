import 'package:flutter/material.dart';

class Appservices {
  static getScreenHeight(context) => MediaQuery.of(context).size.height;
  static getScreenWidth(context) => MediaQuery.of(context).size.width;
  static addheight(double height) => SizedBox(
        height: height,
      );
  static addWidth(double width) => SizedBox(
        width: width,
      );
  static pushto(BuildContext context, Widget screen) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screen));
  static goback(BuildContext context) => Navigator.of(context).pop();

  static pushNamed(BuildContext context, String screen) =>
      Navigator.of(context).pushNamed(screen);
  static pushAndRemoveUntilNamed(BuildContext context, String screen) =>
      Navigator.of(context).pushNamedAndRemoveUntil(screen, (route) => false);

  static pushandreplace(BuildContext context, Widget screen) =>
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  static pushandremoveuntil(BuildContext context, Widget screen) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen), (route) => false);
}
