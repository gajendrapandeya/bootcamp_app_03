import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({required this.onComplete, super.key});
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 60,
      initialDuration: 0,
      controller: CountDownController(),
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.3,
      ringColor: Colors.white,
      fillColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      strokeWidth: 8.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      onComplete: onComplete,
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        return Function.apply(defaultFormatterFunction, [duration]);
      },
    );
  }
}
