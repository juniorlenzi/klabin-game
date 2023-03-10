import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klabin_game/components/button.dart';
import 'package:klabin_game/components/text.component.dart';
import 'package:klabin_game/contants.dart';
import 'package:klabin_game/pages/question.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background-welcome.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * defaultHorizontalPadding,
              vertical: size.height * defaultVerticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  width: size.width * 0.35,
                  image: const AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
                SizedBox(height: size.height * 0.07),
                AppText(
                  'Olá!',
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  color: darkyGreen,
                ),
                SizedBox(height: size.height * 0.015),
                AppText(
                  'No Parque Ecológico Klabin vivem diversos animais Alguns deles emitem sons inconfundíveis.',
                  fontSize: 4,
                  color: lightGreen,
                ),
                SizedBox(height: size.height * 0.015),
                AppText(
                  'Será que você consegue adivinhar?',
                  fontWeight: FontWeight.w900,
                  color: darkyGreen,
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: AppButton(
                      label: 'Vamos nessa?',
                      backgroundColor: lightGreen,
                      fontWeight: FontWeight.w900,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionPage(step: 0)));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
