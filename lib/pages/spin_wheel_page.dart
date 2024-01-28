import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truth_and_dare/model/category.dart';
import 'package:truth_and_dare/model/player.dart';
import 'package:truth_and_dare/pages/result_page.dart';
import 'package:truth_and_dare/utils/pref_service.dart';
import 'package:truth_and_dare/widgets/button.dart';
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
  int _totalCompletedRounds = 0;

  bool _isGameFinished = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await PrefService.savePlayers(widget.players);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: AppColor.whiteColor,
        centerTitle: true,
        title: Text(
          'Round $_totalCompletedRounds',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _pushToResultsPage(),
            icon: Icon(MdiIcons.trophy),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            AspectRatio(
              aspectRatio: 1,
              child: NameWheel(
                players: widget.players.map((e) => e.name).toList(),
                onWheelStop: (selectedPlayerName) async {
                  final String? result = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => SelectTurnDialog(
                      playerName: selectedPlayerName,
                    ),
                  );

                  if (!mounted) return;

                  setState(() {
                    _totalCompletedRounds += 1;
                  });

                  if (result != null) {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return TruthOrDarePage(
                          truthOrDare: result,
                          category: widget.selectedCategory,
                          currentPlayer: widget.players.firstWhere((element) => element.name == selectedPlayerName),
                        );
                      }),
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
            ),
            const Spacer(),
            if (_totalCompletedRounds != 0)
              PrimaryButton(
                buttonText: 'End Game',
                buttonBackgroundColor: AppColor.accentColor,
                textColor: AppColor.whiteColor,
                onButtonTap: () {
                  setState(() {
                    _isGameFinished = true;
                  });
                  _pushToResultsPage();
                },
              ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  void _pushToResultsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ResultPage(
          players: widget.players,
          totalRounds: _totalCompletedRounds,
          isGameFinished: _isGameFinished,
        ),
      ),
    );
  }
}
