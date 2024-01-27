import 'package:flutter/material.dart';
import 'package:truth_and_dare/utils/colors.dart';

class TruthOrDarePage extends StatefulWidget {
  const TruthOrDarePage({required this.truthOrDare, super.key});

  final String truthOrDare;

  @override
  State<TruthOrDarePage> createState() => _TruthOrDarePageState();
}

class _TruthOrDarePageState extends State<TruthOrDarePage> {
  late bool isTruth = widget.truthOrDare == 'Truth';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTruth ? AppColor.secondaryColor : AppColor.accentColor,
    );
  }
}
