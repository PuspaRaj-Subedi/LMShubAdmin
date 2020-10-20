import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'config/config.dart' as config;
import 'repository/user_repository.dart' as userRepo;
import 'route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("configuration");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    userRepo.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMShub',
      initialRoute: '/Splash',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        accentColor: config.Colors().mainColor(1),
        dividerColor: config.Colors().accentColor(0.1),
        focusColor: config.Colors().accentColor(1),
        hintColor: config.Colors().secondColor(1),
        textTheme: TextTheme(
          headline5: TextStyle(
              fontSize: 22.0,
              color: config.Colors().secondColor(1),
              height: 1.3),
          headline4: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: config.Colors().secondColor(1),
              height: 1.3),
          headline3: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: config.Colors().secondColor(1),
              height: 1.3),
          headline2: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: config.Colors().mainColor(1),
              height: 1.4),
          headline1: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w300,
              color: config.Colors().secondColor(1),
              height: 1.4),
          subtitle1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: config.Colors().secondColor(1),
              height: 1.3),
          headline6: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
              color: config.Colors().mainColor(1),
              height: 1.3),
          bodyText2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: config.Colors().secondColor(1),
              height: 1.2),
          bodyText1: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: config.Colors().secondColor(1),
              height: 1.3),
          caption: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              color: config.Colors().accentColor(1),
              height: 1.2),
        ),
      ),
    );
  }
}
