import 'package:flutter/material.dart';
import 'package:truth_and_dare/utils/colors.dart';
import 'package:truth_and_dare/widgets/button.dart';

class AddNameDialog extends StatefulWidget {
  const AddNameDialog({
    super.key,
  });

  @override
  State<AddNameDialog> createState() => _AddNameDialogState();
}

class _AddNameDialogState extends State<AddNameDialog> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Dialog(
        backgroundColor: AppColor.whiteColor,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Player',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: _textEditingController,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(),
                    labelText: 'Player Name',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    )
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onButtonTap: () => Navigator.of(context).pop(),
                        buttonText: 'Cancel',
                        buttonBackgroundColor: Colors.grey.shade500,
                        textColor: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: PrimaryButton(
                        buttonText: 'Ok',
                        buttonBackgroundColor: AppColor.successColor,
                        onButtonTap: () => Navigator.of(context).pop(_textEditingController.text),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
