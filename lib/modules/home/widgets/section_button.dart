// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/ui/colors/app_colors.dart';
import 'package:portfolio/ui/fonts/app_fonts.dart';

class SectionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SectionButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) return AppColors.secColor;
          return Colors.white;
        }),
      ),
      child: Text(text,
          style:
              AppFonts.textButton(MediaQuery.of(context).size.height * 0.023)),
    );
  }
}
