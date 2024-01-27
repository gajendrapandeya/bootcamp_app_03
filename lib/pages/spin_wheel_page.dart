import 'package:flutter/material.dart';
import 'package:truth_and_dare/model/category.dart';
import 'package:truth_and_dare/widgets/name_wheel.dart';
import 'package:truth_and_dare/pages/truth_or_dare_page.dart';
import 'package:truth_and_dare/utils/colors.dart';
import 'package:truth_and_dare/widgets/select_turn_dialog.dart';

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: AppColor.whiteColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: NameWheel(
                  players: widget.players,
                  onWheelStop: (selectedPlayer) async {
                    final String? result = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => SelectTurnDialog(
                        playerName: selectedPlayer,
                      ),
                    );

                    if (result != null && mounted) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => TruthOrDarePage(truthOrDare: result)),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 64),
              const Text(
                'Tap on the wheel to spin it',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whiteColor,
                ),
              )
            ],
          ),
        ));
  }
}
