import 'package:flutter/material.dart';
import 'package:processos_dashboard/_routing/routes.dart';
import 'package:processos_dashboard/pages/main_page_dashboard.dart';
import 'package:processos_dashboard/views/landing.dart';
import 'package:processos_dashboard/views/login.dart';
import 'package:processos_dashboard/views/register.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingViewRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => MainPage());
    case loginViewRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case registerViewRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    default:
      return MaterialPageRoute(builder: (context) => LandingPage());
  }
}
