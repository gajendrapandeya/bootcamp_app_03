import 'dart:math';
import 'package:flutter/material.dart';
import 'package:truth_and_dare/widgets/pointer_painter.dart';

class ColorWheel extends StatefulWidget {
  const ColorWheel({
    required this.players,
    this.onWheelTap,
    this.wheelBorder = 8,
    this.showWheelTip = true,
    super.key,
  });

  final List<String> players;
  final VoidCallback? onWheelTap;
  final double wheelBorder;
  final bool showWheelTip;

  @override
  State<ColorWheel> createState() => _ColorWheelState();
}

class _ColorWheelState extends State<ColorWheel> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          selectPlayer();
        }
      });
  }

  void selectPlayer() {
    // Logic to determine which player is selected
    // Example: Use the controller's value to calculate the angle and find the selected player
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: widget.onWheelTap != null
                ? () {
                    if (!controller.isAnimating) {
                      controller.forward(from: 0);
                    }
                  }
                : null,
            child: Transform.rotate(
              angle: 2 * pi * animation.value,
              child: CustomPaint(
                painter: WheelPainter(
                  players: widget.players,
                  wheelBorderWidth: widget.wheelBorder,
                ),
                size: const Size(300, 300),
              ),
            ),
          ),
          if (widget.showWheelTip)
            Positioned(
              top: -8,
              child: CustomPaint(
                painter: PointerPainter(),
                size: const Size(20, 20),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class WheelPainter extends CustomPainter {
  final List<String> players;
  final double wheelBorderWidth;

  WheelPainter({
    required this.players,
    required this.wheelBorderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var fullCircle = 2 * pi;
    var segmentAngle = fullCircle / players.length;

    for (int i = 0; i < players.length; i++) {
      var paint = Paint()..color = Colors.primaries[i % Colors.primaries.length];
      canvas.drawArc(rect, segmentAngle * i, segmentAngle, true, paint);

      // Add text for each segment
      var textPainter = TextPainter(
        text: TextSpan(
          text: players[i],
          style: const TextStyle(color: Colors.white),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      var x = (size.width / 2) + (size.width / 3 * cos(segmentAngle * i + segmentAngle / 2)) - textPainter.width / 2;
      var y = (size.height / 2) + (size.height / 3 * sin(segmentAngle * i + segmentAngle / 2)) - textPainter.height / 2;
      textPainter.paint(canvas, Offset(x, y));
    }

    // Draw the circle border
    var borderPaint = Paint()
      ..color = const Color(0xff252D4F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = wheelBorderWidth;

    canvas.drawCircle(rect.center, size.width / 2, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
