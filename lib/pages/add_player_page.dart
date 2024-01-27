import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:truth_and_dare/utils/colors.dart';
import 'package:truth_and_dare/widgets/add_player_dialog.dart';
import 'package:truth_and_dare/widgets/button.dart';
import 'package:truth_and_dare/widgets/no_data_widget.dart';

class AddPlayerPage extends StatefulWidget {
  const AddPlayerPage({super.key});

  @override
  State<AddPlayerPage> createState() => _AddPlayerPageState();
}

class _AddPlayerPageState extends State<AddPlayerPage> {
  final List<String> _players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.whiteColor),
          backgroundColor: AppColor.primaryColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_players.isEmpty) ...[
                  const NoDataWidget(
                    text: 'No Players Added. Start adding player to begin the game.',
                  ),
                ] else ...[
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Players',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: ((context, index) => _addPlayerListItem(index)),
                      itemCount: _players.length,
                    ),
                  ),
                  const Spacer(),
                  const PrimaryButton(
                    buttonText: 'Get Started',
                    buttonBackgroundColor: AppColor.whiteColor,
                    textColor: AppColor.primaryColor,
                  ),
                  const SizedBox(height: 64),
                ],
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: _buildAddPlayerButton(context));
  }

  Widget _addPlayerListItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Player ${index + 1}'.toUpperCase(),
          style: const TextStyle(
            color: AppColor.whiteColor,
            fontSize: 14,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _players[index],
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () => setState(() {
                _players.removeAt(index);
              }),
              icon: Icon(
                MdiIcons.close,
                color: Colors.white,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  ElevatedButton _buildAddPlayerButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.secondaryColor,
        foregroundColor: Colors.white,
      ),
      onPressed: () async {
        final String? playerNameOrNull = await showDialog(
          context: context,
          barrierColor: Colors.black.withOpacity(0.4),
          barrierDismissible: false,
          builder: (context) => const AddNameDialog(),
        );

        if (playerNameOrNull != null && playerNameOrNull.isNotEmpty) {
          setState(() {
            _players.add(playerNameOrNull);
          });
        }
      },
      icon: Icon(
        MdiIcons.plus,
        size: 18,
      ),
      label: const Text(
        'Add Player',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}