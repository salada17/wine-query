import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:winequery/core/model/wine.dart';
import 'package:winequery/ui/view/main.view.dart';
import 'package:winequery/ui/view/signin.view.dart';
import 'package:winequery/ui/view/winesearch.view.dart';
import 'package:winequery/ui/view/purchase.view.dart';

const String initialRoute = "login";

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainView());
      case 'login':
        return MaterialPageRoute(builder: (_) => SigninView());
      // case 'wine':
      //   var post = settings.arguments as Post;
      //   return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
