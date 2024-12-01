import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_thimar/core/logic/cash_helper.dart';
import 'package:flutter_thimar/features/get_it.dart';
import 'package:flutter_thimar/features/kiwi.dart';
import 'package:flutter_thimar/views/widgets/form/form.dart';
import 'package:flutter_thimar/views/widgets/simple_maps/simple_maps.dart';
import 'package:flutter_thimar/views/widgets/video_player/video_player.dart';

//import 'firebase_options.dart';
import 'core/logic/helper_methods.dart';
import 'views/google_maps/maps.dart';
import 'views/main/home_nav/view.dart';
import 'views/widgets/checkbox/check.dart';
import 'views/widgets/date_picker/date_picker.dart';
import 'views/widgets/dismisible/dismisible.dart';
import 'views/widgets/dotted_border/dotted_border.dart';
import 'views/widgets/flutter_html/flutter_html.dart';
import 'views/widgets/image_picker/simple.dart';
import 'views/widgets/image_picker/simple_dialog.dart';
import 'views/widgets/image_picker/simple_sheet.dart';
import 'views/widgets/interactive_viewer/view.dart';
import 'views/widgets/lottie/lottie.dart';
import 'views/widgets/maps_lancher/maps_lancher.dart';
import 'views/widgets/pageview_builder/pageview_builder.dart';
import 'views/widgets/progress_bars/progress_bars.dart';
import 'views/widgets/ratinng_bar/rating_bar.dart';
import 'views/widgets/shimmer/shimmer.dart';
import 'views/widgets/slidable_package/slidable_package.dart';
import 'views/widgets/switch/switch.dart';
import 'views/widgets/tab_bar/tab_bar.dart';
import 'views/widgets/tab_bar/view3.dart';
import 'views/widgets/text_rich/text_rich.dart';
import 'views/widgets/time_picker/time_picker.dart';
import 'views/widgets/translation_radio/translation_radio.dart';
import 'views/widgets/url_lancher/url_lancher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  initKiwi();
  initGetIt();
  CashHelper.init();
  runApp(  EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar'),Locale('fr')],
      path: 'assets/translation', // <-- change the path of the translation files
      startLocale: Locale('en'),
      fallbackLocale: Locale('en'),
      child: MyApp()
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 810),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Thimar',
          navigatorKey: navigtorKey,
          debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            //locale: context.deviceLocale,
            locale: context.locale,
          theme: ThemeData(
            fontFamily: "Montserrat",
            scaffoldBackgroundColor: Color(0xffffffff),
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.green, primary: Colors.green),
              useMaterial3: true,
              /*filledButtonTheme: FilledButtonThemeData(
                  style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  )
              ),*/
            /*inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25)
              )
            )*/
            inputDecorationTheme: InputDecorationTheme(
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.yellow
                )
              ),
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                fixedSize: Size.fromHeight(50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              )
            ),
            appBarTheme: AppBarTheme(
              color: Colors.yellow,
              centerTitle: true,
              titleTextStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: Colors.red,fontFamily: "ProtestRevolution"),

            )
          ),
          home: child
        );
      },
      child:  MyInteractiveViewer(),
    );
  }
}


