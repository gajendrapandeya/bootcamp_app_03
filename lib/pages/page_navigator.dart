import 'package:flutter/material.dart';
import 'package:truth_and_dare/model/player.dart';
import 'package:truth_and_dare/pages/add_player_page.dart';
import 'package:truth_and_dare/pages/onboarding_page.dart';
import 'package:truth_and_dare/utils/pref_service.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({super.key});

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  List<Player>? _players;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _players = await PrefService.getPlayers();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_players?.isNotEmpty ?? false) ? const AddPlayerPage() : const OnboardingPage();
  }
}
