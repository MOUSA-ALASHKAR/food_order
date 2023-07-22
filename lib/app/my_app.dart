import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:food_order/core/enums/connectivityStatus.dart';
import 'package:food_order/core/translations/app_translations.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/splash_screen/splash_screen_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp , DeviceOrientation.landscapeLeft , DeviceOrientation.landscapeLeft],
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
        create: (context) => connectivityService.connectivityStatusController.stream,
        initialData: ConnectivityStatus.ONLINE,
        child: GetMaterialApp(
            defaultTransition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 300),
            translations: AppTranslation(),
            locale: getLocal(),
            fallbackLocale: getLocal(),
            builder: BotToastInit(), //1. call BotToastInit
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              textTheme: TextTheme(bodyMedium: GoogleFonts.chakraPetch()),
            ),

        home: SplashScreenView())
    );
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else {
    return Locale('en', 'US');
  }
}