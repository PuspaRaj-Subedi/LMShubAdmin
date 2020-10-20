import 'package:LMShubAdmin/models/route_argument.dart';
import 'package:LMShubAdmin/views/login.dart';
import 'package:LMShubAdmin/views/register.dart';
import 'package:LMShubAdmin/views/details.dart';
import 'package:LMShubAdmin/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:LMShubAdmin/views/libary.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginWidget());
      case '/Register':
        return MaterialPageRoute(builder: (_) => RegisterWidget());
      case '/Libary':
        return MaterialPageRoute(builder: (_) => LibaryWidget());
      case '/Details':
        return MaterialPageRoute(
            builder: (_) =>
                BookDetailWidget(routeArgument: args as RouteArgument));
      // case '/ProductDetails':
      //   return MaterialPageRoute(
      //       builder: (_) =>
      //           ProductDetailsWidget(routeArgument: args as RouteArgument));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page Not Found'),
        ),
      );
    });
  }
}
