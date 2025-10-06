import 'package:flutter/material.dart';
import 'package:taskgameproject/util/colorconstraint.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Color? bgColor;

  const CustomButton({super.key, this.title, this.onPressed, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          bgColor ?? const Color(0xffFFC00E),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      child: Text(
        title ?? '',
        style: TextStyle(
          color: ColorConstraint.textColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
