// import 'package:flutter/material.dart';
// import 'package:movie_app/screen/home.dart';
//
// //Config screen path
// const homePath = "/home";
// const unknownPath = "/404";
//
// //Config screen ui
// enum PageUI {
//   home,
//   unknown
// }
//
// class MovieRoute {
//
//   Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
//     var uri = Uri.parse(routeSettings.name ?? "");
//
//     if(uri.pathSegments.isEmpty) {
//
//     }
//
//     switch(getType(uri.pathSegments[0])){
//       case PageUI.home:
//         return MaterialPageRoute(builder: (context) => const Home());
//       case PageUI.unknown:
//         // TODO: Handle this case.
//         break;
//     }
//   }
//
//   PageUI getType(String name) {
//     for(PageUI screen in PageUI.values) {
//       if(screen.name == name) {
//         return screen;
//       }
//     }
//     return PageUI.unknown;
//   }
//
//   static void goToPage(BuildContext context, PageUI page) {
//     Navigator.of(context).pushNamed()
//   }
//
//   static String pageUiToPath(PageUI page) {
//     switch(page) {
//       case PageUI.home:
//         return homePath;
//       case PageUI.unknown:
//         return unknownPath;
//     }
//   }
// }
//
