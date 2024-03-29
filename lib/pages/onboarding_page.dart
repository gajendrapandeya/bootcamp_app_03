import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truth_and_dare/widgets/name_wheel.dart';
import 'package:truth_and_dare/pages/add_player_page.dart';
import 'package:truth_and_dare/utils/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 200,
                width: 200,
                child: NameWheel(
                  players: ['', '', '', '', '', '', '', '', '', ''],
                  showWheelTip: false,
                ),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            const Text(
              'Welcome to Truth or Dare 😉',
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              'Get to know your friends by playing game a fun game of Truth or Dare!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.whiteColor.withOpacity(0.7),
                fontSize: 14,
                height: 1.75,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.successColor,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const AddPlayerPage(),
              ),
            );
          },
          icon: Icon(
            MdiIcons.chevronRight,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
