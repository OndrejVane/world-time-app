import 'package:flutter/material.dart';
import 'package:time_app/pages/choose_location.dart';
import 'package:time_app/pages/home.dart';
import 'package:time_app/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/choose_location": (context) => const ChooseLocation(),
      },
    ));
