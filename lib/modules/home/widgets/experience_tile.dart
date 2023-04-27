import 'package:flutter/material.dart';

import '../../../ui/colors/app_colors.dart';
import '../../../ui/fonts/app_fonts.dart';

class ExperienceTile extends StatelessWidget {
  final String date;
  final String jobTittle;
  final String jobDescription;
  const ExperienceTile(
      {Key? key,
      required this.date,
      required this.jobTittle,
      required this.jobDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.backgroundAbout,
        border: Border.all(color: AppColors.secColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: AppColors.secColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  date,
                  style: AppFonts.experienceDates(
                      MediaQuery.of(context).size.height * 0.014),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                jobTittle,
                style: AppFonts.titleName(
                    MediaQuery.of(context).size.height * 0.020),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, top: 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                jobDescription,
                style: AppFonts.resumeText(
                    MediaQuery.of(context).size.height * 0.015),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
