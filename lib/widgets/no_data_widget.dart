import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: SvgPicture.asset('assets/svg/empty.svg'),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, height: 1.75),
        )
      ],
    );
  }
}
