import 'package:flutter/material.dart';
import 'package:truth_and_dare/utils/colors.dart';
import 'package:truth_and_dare/widgets/button.dart';

class SelectTurnDialog extends StatelessWidget {
  const SelectTurnDialog({
    required this.playerName,
    super.key,
  });
  final String playerName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.whiteColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                text: "It's your turn",
                style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: ' $playerName',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.successColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    buttonText: 'Truth',
                    buttonBackgroundColor: AppColor.secondaryColor,
                    textColor: AppColor.whiteColor,
                    onButtonTap: () => Navigator.of(context).pop('Truth'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: PrimaryButton(
                    buttonText: 'Dare',
                    buttonBackgroundColor: AppColor.accentColor,
                    textColor: AppColor.whiteColor,
                    onButtonTap: () => Navigator.of(context).pop('Dare'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
