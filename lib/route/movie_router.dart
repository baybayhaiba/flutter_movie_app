import 'package:flutter/material.dart';
import 'package:movie_app/screen/home.dart';
import 'package:movie_app/screen/unknown.dart';

//Config screen path
const homePath = "/home";
const unknownPath = "/404";

//Config screen ui
enum PageUI {
  home,
  unknown
}

class MovieRoute {

  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    var uri = Uri.parse(routeSettings.name ?? "");

    if(uri.pathSegments.isEmpty) {
      return MaterialPageRoute(builder: (context) => Home());
    }

    switch(getType(uri.pathSegments[0])){
      case PageUI.home:
        return MaterialPageRoute(builder: (context) => Home());
      case PageUI.unknown:
      default:
        return MaterialPageRoute(builder: (context) => const UnknownScreen());
    }
  }

  PageUI getType(String name) {
    for(PageUI screen in PageUI.values) {
      if(screen.name == name) {
        return screen;
      }
    }
    return PageUI.unknown;
  }

  static void goToPage({required BuildContext context, required PageUI page}) {
    Navigator.of(context).pushNamed(pageUiToPath(page));
  }

  static void backPage({required BuildContext context}) {
    Navigator.pop(context);
  }

  static String pageUiToPath(PageUI page) {
    switch(page) {
      case PageUI.home:
        return homePath;
      case PageUI.unknown:
      default:
        return unknownPath;
    }
  }
}

