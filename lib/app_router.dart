import 'package:bloc_ex/constants/strings.dart';
import 'package:bloc_ex/presentation/screens/splash.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppCharRoute.splash:
        return MaterialPageRoute(builder: (_)=> const Splash());
    }
    return null;
  }
}