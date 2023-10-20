import 'package:flutter/material.dart';
import 'package:news/Home-Page/Homepage.dart';
import 'package:news/splashscreen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            toolbarHeight: 100,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
            color: Color(0xFF459A4E),
            iconTheme: IconThemeData(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF459A4E),
          primary: const Color(0xFF459A4E),
        ),
        useMaterial3: true,
      ),
      routes: {
        Homepage.RouteName: (_) => Homepage(),
        Splashscreen.RouteName:(_)=>Splashscreen()
      },
      initialRoute: Splashscreen.RouteName,
    );
  }
}
