import 'package:flutter/material.dart';

import 'screen/home.dart';

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
      home: MyHome(),
      title: "پیش بینی فوتبال",
    );
  }
}
