import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truth_and_dare/model/category.dart';
import 'package:truth_and_dare/model/player.dart';
import 'package:truth_and_dare/utils/colors.dart';
import 'package:truth_and_dare/widgets/button.dart';
import 'package:truth_and_dare/widgets/countdown_timer.dart';

class TruthOrDarePage extends StatefulWidget {
  const TruthOrDarePage({
    required this.truthOrDare,
    required this.category,
    required this.currentPlayer,
    super.key,
  });

  final String truthOrDare;
  final Category category;
  final Player currentPlayer;

  @override
  State<TruthOrDarePage> createState() => _TruthOrDarePageState();
}

class _TruthOrDarePageState extends State<TruthOrDarePage> {
  late bool isTruth = widget.truthOrDare == 'Truth';
  final Random _random = Random();

  late int truthCount = widget.category.truths.length;
  late int dareCount = widget.category.truths.length;

  late int questionCount = isTruth ? truthCount : dareCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTruth ? AppColor.secondaryColor : AppColor.accentColor,
      appBar: AppBar(
        backgroundColor: isTruth ? AppColor.secondaryColor : AppColor.accentColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(MdiIcons.close),
        ),
        title: Text(
          "It's a ${isTruth ? 'Truth' : 'Dare'}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                isTruth ? '😜' : '🤪',
                style: const TextStyle(fontSize: 80),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              '${widget.currentPlayer.name}\'s turn',
              style: const TextStyle(
                fontSize: 14,
                color: AppColor.whiteColor,
                height: 1.75,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              isTruth
                  ? widget.category.truths[_random.nextInt(questionCount)]
                  : widget.category.dares[_random.nextInt(questionCount)],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CountdownTimer(
              onComplete: () {
                Navigator.of(context).pop();
              },
            ),
            const Spacer(),
            PrimaryButton(
              buttonText: 'Done',
              suffixWidget: const Text(
                '+1 pts',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whiteColor,
                ),
              ),
              onButtonTap: () {
               isTruth ? widget.currentPlayer.completedTruths() : widget.currentPlayer.completedDares();
                Navigator.of(context).pop(widget.currentPlayer);
              },
              buttonBackgroundColor: AppColor.primaryColor,
              textColor: AppColor.whiteColor,
            ),
            const SizedBox(
              height: 16,
            ),
            PrimaryButton(
              buttonText: 'Give up',
              suffixWidget: const Text(
                '+ 0pts',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
              buttonBackgroundColor: AppColor.whiteColor,
              textColor: AppColor.primaryColor,
              onButtonTap: () {
                widget.currentPlayer.gaveUps();
                Navigator.of(context).pop(widget.currentPlayer);
              },
            ),
          ],
        ),
      ),
    );
  }
}
