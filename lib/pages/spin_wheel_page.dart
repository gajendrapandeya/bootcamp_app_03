import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truth_and_dare/model/category.dart';
import 'package:truth_and_dare/model/player.dart';
import 'package:truth_and_dare/widgets/name_wheel.dart';
import 'package:truth_and_dare/pages/truth_or_dare_page.dart';
import 'package:truth_and_dare/utils/colors.dart';
import 'package:truth_and_dare/widgets/select_turn_dialog.dart';

class SpinWheelPage extends StatefulWidget {
  const SpinWheelPage({required this.players, required this.selectedCategory, super.key});

  final List<Player> players;
  final Category selectedCategory;

  @override
  State<SpinWheelPage> createState() => _SpinWheelPageState();
}

class _SpinWheelPageState extends State<SpinWheelPage> {
  // TODO: (GAZ) Update the final logic

  int _roundNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          foregroundColor: AppColor.whiteColor,
          title: Text(
            'Round $_roundNumber',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(MdiIcons.trophy),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: NameWheel(
                  players: widget.players.map((e) => e.name).toList(),
                  onWheelStop: (selectedPlayerName) async {
                    final String? playerNameOrNull = await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => SelectTurnDialog(
                        playerName: selectedPlayerName,
                      ),
                    );

                    if (!mounted) return;

                    setState(() {
                      _roundNumber += 1;
                    });

                    if (playerNameOrNull != null) {
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) {
                          return TruthOrDarePage(
                            truthOrDare: playerNameOrNull,
                            category: widget.selectedCategory,
                            currentPlayer: widget.players.firstWhere((element) => element.name == selectedPlayerName),
                          );
                        }),
                      );
                      if (result != null) {
                        debugPrint('result: ${result.toString()}');
                      }
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
