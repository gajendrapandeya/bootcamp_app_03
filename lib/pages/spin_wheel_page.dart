import 'package:flutter/material.dart';
import 'package:truth_and_dare/model/category.dart';

class SpinWheelPage extends StatefulWidget {
  const SpinWheelPage({required this.players, required this.selectedCategory, super.key});

  final List<String> players;
  final Category selectedCategory;

  @override
  State<SpinWheelPage> createState() => _SpinWheelPageState();
}

class _SpinWheelPageState extends State<SpinWheelPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Spin Wheel Page'),
      ),
    );
  }
}
