import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klabin_game/components/button.dart';
import 'package:klabin_game/components/hexcolor.component.dart';
import 'package:klabin_game/components/text.component.dart';
import 'package:klabin_game/contants.dart';

import 'package:klabin_game/pages/welcome.page.dart';

class EndGamePage extends StatefulWidget {
  const EndGamePage({super.key});

  @override
  State<EndGamePage> createState() => _EndGamePageState();
}

class _EndGamePageState extends State<EndGamePage> {
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
                image: AssetImage('assets/images/background-end.png'),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  'Fim de jogo',
                  color: HexColor('#60AB4B'),
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(height: size.height * 0.03),
                const AppText(
                  'Agora você já conhece alguns dos animais que vivem no Parque Ecológico.',
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 5,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.2),
                AppButton(
                  label: 'Recomeçar o jogo',
                  width: .5,
                  backgroundColor: lightGreen,
                  fontWeight: FontWeight.w900,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomePage()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
