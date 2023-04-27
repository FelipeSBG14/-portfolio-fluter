import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/models/utils/images_constants.dart';
import 'package:portfolio/ui/colors/app_colors.dart';

import '../../../ui/fonts/app_fonts.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.92,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Meus',
              style: AppFonts.aboutText(
                MediaQuery.of(context).size.height * 0.05,
                Colors.white,
              ),
              children: [
                TextSpan(
                  text: ' Projetos',
                  style: AppFonts.aboutText(
                    MediaQuery.of(context).size.height * 0.05,
                    AppColors.secColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.8,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlayAnimationDuration: const Duration(
                  seconds: 2,
                ),
                autoPlay: true,
                height: MediaQuery.of(context).size.height * 0.80,
              ),
              items: ImagesConstants.images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return image;
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
