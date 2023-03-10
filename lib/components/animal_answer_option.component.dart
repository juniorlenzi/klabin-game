import 'package:flutter/material.dart';
import 'package:klabin_game/components/text.component.dart';
import 'package:klabin_game/contants.dart';

class AnimalAnswerOption extends StatelessWidget {
  const AnimalAnswerOption({super.key, required this.order, required this.name, required this.image, required this.onPressed});

  final int order;
  final String name;
  final String image;

  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final currentOrder = order + 1;

    final itemSize = size.width * 0.27;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onPressed(order);
          },
          child: Column(children: [
            Image(
              image: AssetImage(image),
              width: itemSize,
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              width: itemSize,
              color: darkyGreen,
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
              ),
              child: Center(
                  child: AppText(
                '$currentOrder. $name',
                fontWeight: FontWeight.w900,
                fontSize: 3.5,
                letterSpacing: 1,
              )),
            ),
          ]),
        ),
        SizedBox(
          width: size.width * 0.02,
        )
      ],
    );
  }
}
