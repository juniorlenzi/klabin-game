import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klabin_game/components/button.dart';
import 'package:klabin_game/components/hexcolor.component.dart';
import 'package:klabin_game/components/text.component.dart';
import 'package:klabin_game/contants.dart';
import 'package:klabin_game/pages/end_game.page.dart';
import 'package:klabin_game/pages/question.page.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage({super.key, required this.step, required this.isCorrect});
  final int step;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    Size size = MediaQuery.of(context).size;
    Animal animal = animals[step];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(animal.answerImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * defaultHorizontalPadding,
              vertical: size.height * defaultVerticalPadding,
            ),
            margin: EdgeInsets.only(
              top: size.height * 0.5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  isCorrect ? animal.rightTitle : animal.wrongTitle,
                  color: HexColor('#60AB4B'),
                  fontSize: 5.3,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(height: size.height * 0.01),
                if (isCorrect)
                  const Center(
                    child: AppText(
                      'Seu ouvido está aguçado.',
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 5.3,
                    ),
                  ),
                SizedBox(height: size.height * 0.03),
                AppText(
                  animal.answerText,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 4.2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.04),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: AppButton(
                      label: 'Próxima rodada',
                      backgroundColor: lightGreen,
                      fontWeight: FontWeight.w900,
                      onPressed: () {
                        if (step == 4) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const EndGamePage()));

                          return;
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionPage(step: step + 1)));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
