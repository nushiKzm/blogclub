import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // static const defaultFontFamily = 'Avenir'; with flutter gen i dont need it anymore
  //you can access this property (MyApp.defaultFontFamily) in any where
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = const Color(0xff0D253C);
    final secondaryTextColor = const Color(0xff2D4379);
    final primaryColor = const Color(0xff376AED);
    final secondaryColor = const Color(0xff386BED);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          elevation: 0,
          titleSpacing: 40,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontFamily: FontFamily.avenir,
                // color: primaryColor, //dont work!
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: secondaryColor,
          surface: Colors.white,
          onSurface: primaryTextColor,
          background: const Color(0xffF4F7FF),
          onBackground: primaryTextColor,
        ),

        textTheme: TextTheme(
            headlineMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
            headlineSmall: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            titleMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
            titleSmall: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontWeight: FontWeight.w500,
            ),
            labelLarge: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryColor,
              fontWeight: FontWeight.w800,
            ),
            labelMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
            ),
            labelSmall: TextStyle(
              fontFamily: FontFamily.avenir,
              color: Color(0xff0047CC).withOpacity(0.5),
              fontWeight: FontWeight.w800,
            ),
            bodyMedium: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontWeight: FontWeight.normal,
              height: 1.5,
            )),
      ),
      home: const SplashScreen(),
      // home: const ProfileScreen(),
    );
  }
}
