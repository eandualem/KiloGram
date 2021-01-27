import 'package:flutter/material.dart';
import 'package:kilogram/screens/code_entry.dart';
import 'package:kilogram/screens/login.dart';
import 'const.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case otpRoute:
        return MaterialPageRoute(
          builder: (_) => CodeEntryScreen(),
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case initRoute:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Container(
              color: Colors.white,
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text(
              'No route defined for ${settings.name}',
            )),
          ),
        );
    }
  }
}
