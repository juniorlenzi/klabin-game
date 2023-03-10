import 'package:flutter/material.dart';
import 'package:klabin_game/components/hexcolor.component.dart';

const double defaultHorizontalPadding = 0.06;
const double defaultVerticalPadding = 0.05;
final Color lightGreen = HexColor('#329D48');
final Color darkyGreen = HexColor('#246B36');

class Animal {
  final String name;
  final String questionImage;
  final String answerImage;
  final String rightTitle;
  final String answerText;
  final String wrongTitle;
  final String footerText;
  final String soundFile;

  Animal({
    required this.name,
    required this.questionImage,
    required this.answerImage,
    required this.rightTitle,
    required this.answerText,
    required this.wrongTitle,
    required this.soundFile,
    this.footerText = '',
  });
}

final List<Animal> animals = [
  Animal(
    name: 'Bugio Ruivo',
    questionImage: 'assets/images/option-bugiu.png',
    answerImage: 'assets/images/answer_bugio.png',
    rightTitle: 'Parabéns, é mesmo o Bugio Ruivo!',
    answerText: 'Ele tem capacidade incrível de emitir sons muito altos! Sua vocalização (ronco) pode ser ouvida a uma distância de até 5km.',
    wrongTitle: 'Na verdade, esse é o Bugio Ruivo!',
    soundFile: 'assets/audios/bugio.mp3',
  ),
  Animal(
    name: 'Jacutinga',
    questionImage: 'assets/images/option-jacutinga.png',
    answerImage: 'assets/images/answer_jacutinga.png',
    rightTitle: 'Parabéns, é mesmo a Jacutinga!',
    answerText: 'O nome dela vem do tupi-guarani: "jacu" significa ave e "tinga" significa branco. É uma referência às manchas na cabeça e nas asas.',
    wrongTitle: 'Na verdade, esse é a Jacutinga!',
    soundFile: 'assets/audios/jacutinga.mp3',
  ),
  Animal(
    name: 'Puma',
    questionImage: 'assets/images/option-puma.png',
    answerImage: 'assets/images/answer_puma.png',
    rightTitle: 'Parabéns, é mesmo o Puma!',
    answerText:
        'O puma pode saltar mais de 5 metros de altura. Quando abate uma presa muito grande, que não consegue comer no mesmo dia, cobre o restante com folhas e galhos para voltar depois.',
    wrongTitle: 'Na verdade, esse é o Puma!',
    soundFile: 'assets/audios/puma.mp3',
  ),
  Animal(
    name: 'Ema',
    questionImage: 'assets/images/option-ema.png',
    answerImage: 'assets/images/answer_ema.png',
    rightTitle: 'Parabéns, é mesmo a Ema!',
    answerText:
        'Ela é a maior e mais pesada espécie de ave existente no Brasil, chegando a pesar até 24kg. Mas para fugir dos predadores, pode correr a uma velocidade de até 60km/h.',
    wrongTitle: 'Na verdade, esse é a Ema!',
    soundFile: 'assets/audios/ema.mp3',
  ),
  Animal(
    name: 'Queixada',
    questionImage: 'assets/images/option-queixada.png',
    answerImage: 'assets/images/answer_queixada.png',
    rightTitle: 'Parabéns, é mesmo o Queixada!',
    answerText: 'Esse "porquinho" simpático tem esse nome por que bate os dentes quando se sente ameaçado para alertar e afugentar seus agressores.',
    wrongTitle: 'Na verdade, esse é o Queixada!',
    soundFile: 'assets/audios/queixada.mp3',
  )
];
