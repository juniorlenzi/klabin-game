import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klabin_game/pages/welcome.page.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klabin Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'MinionPro'),
      routes: {
        '/': (context) => _loadPage(const WelcomePage(), context),
      },
    );
  }

  Widget _loadPage(Widget page, BuildContext context) {
    return Scaffold(
      body: page,
    );
  }
}
