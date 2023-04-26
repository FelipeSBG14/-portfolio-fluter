import 'package:flutter/material.dart';
import 'package:portfolio/ui/colors/app_colors.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(children: []),
    );
  }
}
