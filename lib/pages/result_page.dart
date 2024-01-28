import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truth_and_dare/model/player.dart';
import 'package:truth_and_dare/pages/add_player_page.dart';
import 'package:truth_and_dare/utils/colors.dart';
import 'package:truth_and_dare/widgets/button.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    required this.players,
    required this.totalRounds,
    required this.isGameFinished,
    super.key,
  });
  final int totalRounds;
  final List<Player> players;
  final bool isGameFinished;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late ConfettiController _controllerCenter;

  late List<Player> playerSortedByScore = List.from(
    widget.players..sort((Player a, Player b) => b.points.compareTo(a.points)),
  );

  @override
  void initState() {
    _controllerCenter = ConfettiController(duration: const Duration(seconds: 5));
    if (widget.isGameFinished) {
      _controllerCenter.play();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: AppColor.whiteColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(MdiIcons.close),
        ),
        title: const Text(
          'Results',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirection: pi / 2,
              numberOfParticles: 30,
              gravity: 0.8,
              minBlastForce: 2,
              maxBlastForce: 3,
              emissionFrequency: 0.01,
              blastDirectionality: BlastDirectionality.explosive,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Align(
                child: Icon(
                  MdiIcons.trophy,
                  size: 108,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                '${widget.totalRounds} Rounds',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: ((context, index) => _buildResultListItem(playerSortedByScore[index], index)),
                    separatorBuilder: ((context, index) => const SizedBox(
                          height: 16,
                        )),
                    itemCount: playerSortedByScore.length),
              ),
              if (widget.isGameFinished)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: PrimaryButton(
                    buttonText: 'Go Home',
                    onButtonTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddPlayerPage(),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 32,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildResultListItem(Player player, int index) {
    final bool isWinner = widget.isGameFinished && index == 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: isWinner ? Colors.green : Colors.transparent, width: isWinner ? 2 : 1),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${index + 1}.',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.whiteColor,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${player.truthsCompleted} truth / ${player.daresCompleted} dare / ${player.giveUps} giveup',
                      style: const TextStyle(fontSize: 14, color: AppColor.whiteColor, height: 1.75),
                    )
                  ],
                ),
              ],
            ),
          ),
          Text(
            '${player.points} pts',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
