import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_app/Helpers/app_config.dart';

import 'package:whatsapp_app/Utils/routs/routs.dart';
import 'package:whatsapp_app/Utils/routs/routs_name.dart';
import 'package:whatsapp_app/controllers/userdatacontrolller.dart';
import 'package:whatsapp_app/form_screen.dart';
import 'package:whatsapp_app/theme_changer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      builder: (context, child) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => dataservices())
          ],
          child: ScreenUtilInit(
            child: MaterialApp(
              themeMode: themeChanger.themeMode,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.teal,
                iconTheme: IconThemeData(color: Colors.grey.shade600),
              ),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  iconTheme: IconThemeData(color: Colors.grey)),
              // home: MyForm(),
              initialRoute: Routesname.splash,
              onGenerateRoute: Routes.zgenerateRoutes,
            ),
            designSize:
                const Size(AppConfig.screenWidth, AppConfig.screenHeight),
          ),
        );
      },
    );
  }
}
