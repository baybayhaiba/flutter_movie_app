import 'package:flutter/material.dart';
import 'package:movie_app/model/result.dart';
import 'package:movie_app/screen/detail_screen.dart';
import 'package:movie_app/screen/home.dart';
import 'package:movie_app/screen/unknown.dart';

//Config screen path
const homePath = "/home";
const detailPath = "/detail";
const unknownPath = "/404";

//Config screen ui
enum PageUI {
  detail,
  home,
  unknown
}

class MovieRoute {
  static Map<String, Object?> result = <String, Object?>{};

  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    var uri = Uri.parse(routeSettings.name ?? "");

    if(uri.pathSegments.isEmpty) {
      return MaterialPageRoute(builder: (context) => Home());
    }

    switch(getType(uri.pathSegments[0])){
      case PageUI.detail:
        if(uri.pathSegments.length >= 2) {
          var data = getDataFromKey(uri.pathSegments[1].toString()) as Result;
          return MaterialPageRoute(builder: (context) => DetailScreen(result: data,));
        }
        return MaterialPageRoute(builder: (context) => const UnknownScreen());
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

  static Object? getDataFromKey(String key) {
    var data = result[key];
    result.remove(key);
    return data;
  }

  static void goToPage({required BuildContext context, required PageUI page, Bundle? data}) {
    if(data != null) {
      result[data.key] = data.data;
    }
    Navigator.of(context).pushNamed("${pageUiToPath(page)}${data != null ? "/${data.key}" : ""}");
  }

  static void backPage({required BuildContext context}) {
    Navigator.pop(context);
  }

  static String pageUiToPath(PageUI page) {
    switch(page) {
      case PageUI.detail:
        return detailPath;
      case PageUI.home:
        return homePath;
      case PageUI.unknown:
      default:
        return unknownPath;
    }
  }
}

class Bundle {
  Object? data;
  String key;

  Bundle({required this.key, this.data});
}
