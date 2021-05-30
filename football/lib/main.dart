import 'package:flutter/material.dart';

import 'screen/home.dart';
import 'screen/rank_screen.dart';

main(List<String> args) {
  runApp(
    AppWindget(),
  );
}

class AppWindget extends StatelessWidget {
  const AppWindget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: MyHome(),
      title: "پیش بینی فوتبال",
      onGenerateRoute: (RouteSettings setting) {
        if (setting.name == "/") // for home
          return MaterialPageRoute(
            builder: (context) => MyHome(),
            // bring home screen at startup
          );
        if (setting.name == "/screens/rank") // for home
          return MaterialPageRoute(
            builder: (context) => RankScreen(),
            // bring home screen at startup
          );
      },
    );
  }
}
