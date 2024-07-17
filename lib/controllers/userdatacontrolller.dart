import 'package:flutter/material.dart';
import 'package:whatsapp_app/componants/listtile.dart';
import 'package:whatsapp_app/model/all_model.dart';

class dataservices extends ChangeNotifier {
  dynamic _userdata;
  dynamic get userdata => _userdata;

  adduserdata(usermodel data) {
    _userdata = data;
    notifyListeners();
  }
}
