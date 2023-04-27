import 'package:flutter/material.dart';
import 'package:portfolio/ui/colors/app_colors.dart';
import 'package:portfolio/ui/fonts/app_fonts.dart';

class CopyRightSection extends StatelessWidget {
  const CopyRightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundAbout,
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 1,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          'Copyright \u00a9 2023 by Felipe Sanches | Todos os Direitos Preservados',
          style:
              AppFonts.resumeText(MediaQuery.of(context).size.height * 0.015),
        ),
      ]),
    );
  }
}
