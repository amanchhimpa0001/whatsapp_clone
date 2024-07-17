// ignore_for_file: unreachable_switch_case

import 'package:flutter/material.dart';

import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/authentication/conuntry_page.dart';
import 'package:whatsapp_app/authentication/login.dart';
import 'package:whatsapp_app/authentication/otp_screen.dart';

import 'package:whatsapp_app/home_view_page_all/massage_search.dart';
import 'package:whatsapp_app/home_view_page_all/seraching_screen.dart';
import 'package:whatsapp_app/on_boarding/splash_screen.dart';
import 'package:whatsapp_app/on_boarding/welcome_page.dart';
import 'package:whatsapp_app/popupmenuview/ScanQRcode.dart';
import 'package:whatsapp_app/popupmenuview/linked_dvice.dart';
import 'package:whatsapp_app/popupmenuview/new_paymant.dart';
import 'package:whatsapp_app/popupmenuview/paymants.dart';
import 'package:whatsapp_app/popupmenuview/settings.dart';
import 'package:whatsapp_app/popupmenuview/starred_messages.dart';
import 'package:whatsapp_app/Home_scrren/home_page.dart';
import 'package:whatsapp_app/home_view_page_all/calls_screen.dart';
import 'package:whatsapp_app/home_view_page_all/camera_screen.dart';
import 'package:whatsapp_app/home_view_page_all/chat_list_view.dart';
import 'package:whatsapp_app/home_view_page_all/status_screen.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Chat_settings_all_screen/App_language.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Chat_settings_all_screen/Chat_backup.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Chat_settings_all_screen/chat_scren.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Chat_settings_all_screen/theme_screen.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Chat_settings_all_screen/wallpaper_screen.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Help_screen/Help_sccren.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Notifications_all_screen/Notifications_screen.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Storage_and_Data_allscrren/Manage_storage.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Storage_and_Data_allscrren/Network_usage.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/Storage_and_Data_allscrren/Storage_and_Data.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/account_all_screen/Change_number.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/account_all_screen/Delete_my_account.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/account_all_screen/Request_account_info.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/account_all_screen/Security_screen.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/account_all_screen/Two-step_verification.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/account_all_screen/account_screen.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/chat_history/Chat_history.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/chat_history/Export_chat.dart';
import 'package:whatsapp_app/whatsapp_settings_all_screen/profile/profile_screen.dart';

class Routes {
  static MaterialPageRoute zgenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.splash:
        return MaterialPageRoute(
          builder: (context) => Splash_screen(),
        );
      case Routesname.Welcome_page:
        return MaterialPageRoute(
          builder: (context) => Welcome_page(),
        );
      case Routesname.login_page:
        return MaterialPageRoute(
          builder: (context) => login_page(),
        );
      case Routesname.country_page:
        return MaterialPageRoute(
          builder: (context) => Country_page(),
        );
      case Routesname.otp_screen:
        return MaterialPageRoute(
          builder: (context) => otp_screen(),
        );
      case Routesname.home_page:
        return MaterialPageRoute(
          builder: (context) => Home_page(),
        );
      case Routesname.camera_screen:
        return MaterialPageRoute(
          builder: (context) => camera_screen(),
        );
      case Routesname.seraching_chats:
        return MaterialPageRoute(
          builder: (context) => seraching_chats(),
        );
      case Routesname.status_screen:
        return MaterialPageRoute(
          builder: (context) => status_screen(),
        );
      case Routesname.massege_screen:
        return MaterialPageRoute(
          builder: (context) => chat_list_view(),
        );
      case Routesname.calls_screen:
        return MaterialPageRoute(
          builder: (context) => calls_screen(),
        );
      case Routesname.Settings_screen:
        return MaterialPageRoute(
          builder: (context) => Settings_screen(),
        );
      case Routesname.Starrred_Messages:
        return MaterialPageRoute(
          builder: (context) => Starrred_Messages(),
        );
      case Routesname.Payments_screen:
        return MaterialPageRoute(
          builder: (context) => Payments_screen(),
        );
      case Routesname.New_peymants:
        return MaterialPageRoute(
          builder: (context) => New_payment_screen(),
        );

      case Routesname.ScanQRcode:
        return MaterialPageRoute(
          builder: (context) => ScanQRcode_screen(),
        );

      case Routesname.linked_devices:
        return MaterialPageRoute(
          builder: (context) => Link_devices(),
        );
      case Routesname.Profile_screen:
        return MaterialPageRoute(
          builder: (context) => Profile_screen(),
        );
      case Routesname.Account_screen:
        return MaterialPageRoute(
          builder: (context) => Account_screen(),
        );
      case Routesname.Change_number:
        return MaterialPageRoute(
          builder: (context) => Change_number(),
        );
      case Routesname.Delete_my_account:
        return MaterialPageRoute(
          builder: (context) => Delete_my_account(),
        );
      case Routesname.Request_account_info:
        return MaterialPageRoute(
          builder: (context) => Request_account_info(),
        );
      case Routesname.Security_scrren:
        return MaterialPageRoute(
          builder: (context) => Security_scrren(),
        );
      case Routesname.Twostep_verification:
        return MaterialPageRoute(
          builder: (context) => Twostep_verification(),
        );
      case Routesname.App_language:
        return MaterialPageRoute(
          builder: (context) => App_language(),
        );
      case Routesname.Chat_backup_screen:
        return MaterialPageRoute(
          builder: (context) => Chat_backup_screen(),
        );
      case Routesname.Chat_screen:
        return MaterialPageRoute(
          builder: (context) => Chat_screen(),
        );
      case Routesname.Theme_screen:
        return MaterialPageRoute(
          builder: (context) => Theme_dailog(),
        );
      case Routesname.Wallpaper_screen:
        return MaterialPageRoute(
          builder: (context) => Wallpaper_screen(),
        );
      case Routesname.Chat_history:
        return MaterialPageRoute(
          builder: (context) => Chat_history(),
        );
      case Routesname.Export_chat:
        return MaterialPageRoute(
          builder: (context) => Export_chat(),
        );
      case Routesname.Notifications_screen:
        return MaterialPageRoute(
          builder: (context) => Notifications_screen(),
        );
      case Routesname.Storage_and_Data:
        return MaterialPageRoute(
          builder: (context) => Storage_and_Data(),
        );
      case Routesname.Network_usage:
        return MaterialPageRoute(
          builder: (context) => Network_usage(),
        );
      case Routesname.Manage_storage:
        return MaterialPageRoute(
          builder: (context) => Manage_storage(),
        );
      case Routesname.Help_screen:
        return MaterialPageRoute(
          builder: (context) => Help_screen(),
        );
      case Routesname.Massage_search:
        return MaterialPageRoute(
          builder: (context) => Massage_search(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Column(
                    children: [Text("no route difined")],
                  ),
                ));
    }
  }
}
