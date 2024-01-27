import 'package:flutter/material.dart';
import 'package:truth_and_dare/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.buttonText,
    this.suffixWidget,
    this.buttonBackgroundColor,
    this.textColor,
    this.onButtonTap,
    super.key,
  });

  final String buttonText;
  final Widget? suffixWidget;
  final Color? buttonBackgroundColor;
  final Color? textColor;
  final VoidCallback? onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      child: InkWell(
        onTap: onButtonTap,
        splashColor: textColor?.withOpacity(0.3),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
              color: buttonBackgroundColor ?? AppColor.secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (suffixWidget != null) const Spacer(),
              Text(
                buttonText,
                style: TextStyle(
                  color: textColor ?? AppColor.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (suffixWidget != null) ...[
                const Spacer(),
                suffixWidget!,
              ]
            ],
          ),
        ),
      ),
    );
  }
}
