import 'package:flutter/material.dart';
import 'package:processos_dashboard/_routing/routes.dart';
import 'package:processos_dashboard/_routing/router.dart' as router;
import 'package:processos_dashboard/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      onGenerateRoute: router.generateRoute,
      initialRoute: landingViewRoute,
    );
  }
}
