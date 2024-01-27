import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class NameWheel extends StatefulWidget {
  const NameWheel({
    required this.players,
    this.onWheelStop,
    this.wheelBorder = 8,
    this.showWheelTip = true,
    this.shouldAnimateWheelInitially = false,
    super.key,
  });

  final List<String> players;
  final double wheelBorder;
  final bool showWheelTip;
  final ValueChanged<String>? onWheelStop;
  final bool shouldAnimateWheelInitially;

  @override
  State<NameWheel> createState() => _NameWheelState();
}

class _NameWheelState extends State<NameWheel> {
  StreamController<int> selected = StreamController<int>();
  int _currentPlayerIndex = -1;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected.add(
            Fortune.randomInt(0, widget.players.length),
          );
        });
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff252D4F),
                  width: widget.wheelBorder,
                ),
              ),
              child: FortuneWheel(
                animateFirst: false,
                rotationCount: Random().nextInt(10) + 1,
                duration: const Duration(seconds: 1),
                hapticImpact: HapticImpact.heavy,
                selected: selected.stream,
                onAnimationEnd: () => widget.onWheelStop?.call(widget.players[_currentPlayerIndex]),
                onFocusItemChanged: (value) => _currentPlayerIndex = value,
                indicators: widget.showWheelTip
                    ? [
                        const FortuneIndicator(
                          alignment: Alignment.topCenter,
                          child: TriangleIndicator(),
                        )
                      ]
                    : [],
                items: [
                  for (int i = 0; i < widget.players.length; i++)
                    FortuneItem(
                      child: Text(widget.players[i]),
                      style: FortuneItemStyle(
                        color: Colors.primaries[i % Colors.primaries.length],
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
