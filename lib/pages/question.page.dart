import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klabin_game/components/animal_answer_option.component.dart';
import 'package:klabin_game/components/text.component.dart';
import 'package:klabin_game/contants.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:klabin_game/pages/answer.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.step});

  final int step;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late Animal randomAnimal;

  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    await getSoundPath();
  }

  Future<void> getSoundPath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final number = Random().nextInt(animals.length);
    randomAnimal = animals.firstWhere((element) => element.id == number);

    final checRandomAnimal = prefs.getBool('animalId${randomAnimal.id}');
    if (checRandomAnimal == null) {
      await prefs.setBool('animalId${randomAnimal.id}', true);
      setState(() {});
    } else {
      await getSoundPath();
    }
  }

  static final assetsAudioPlayer = AssetsAudioPlayer();

  _checkAnswer(int itemChoosed, int step, BuildContext context) {
    assetsAudioPlayer.stop();
    Navigator.push(context, MaterialPageRoute(builder: (context) => AnswerPage(step: step, isCorrect: itemChoosed == randomAnimal.id, animalId: randomAnimal.id)));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Size size = MediaQuery.of(context).size;
    final currentStep = widget.step + 1;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background-question.png'),
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
                SizedBox(height: size.height * 0.05),
                Image(
                  width: size.width * 0.25,
                  image: AssetImage(
                    'assets/images/step-$currentStep.png',
                  ),
                ),
                SizedBox(height: size.height * 0.045),
                AppText(
                  'Qual animal emite esse som?',
                  fontSize: 7.5,
                  fontWeight: FontWeight.w900,
                  color: darkyGreen,
                ),
                SizedBox(height: size.height * 0.02),
                GestureDetector(
                  onTap: () {
                    assetsAudioPlayer.open(
                      Audio(randomAnimal.soundFile),
                      loopMode: LoopMode.single,
                      showNotification: true,
                    );
                  },
                  child: const Image(
                    image: AssetImage(
                      'assets/images/audio-button.png',
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    for (var i = 0; i < 3; i++)
                      AnimalAnswerOption(
                        id: animals[i].id,
                        order: i,
                        name: animals[i].name,
                        image: animals[i].questionImage,
                        onPressed: (itemChoosed) {
                          _checkAnswer(itemChoosed, widget.step, context);
                        },
                      ),
                  ],
                ),
                SizedBox(height: size.height * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 3; i < 5; i++)
                      AnimalAnswerOption(
                        id: animals[i].id,
                        order: i,
                        name: animals[i].name,
                        image: animals[i].questionImage,
                        onPressed: (itemChoosed) {
                          _checkAnswer(itemChoosed, widget.step, context);
                        },
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
