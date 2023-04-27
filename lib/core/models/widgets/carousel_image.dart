import 'package:flutter/material.dart';
import 'package:portfolio/ui/fonts/app_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselImage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String? url;

  const CarouselImage(
    this.url, {
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 9000,
      child: Column(
        children: [
          Text(
            title,
            style: AppFonts.titleFunction(
                MediaQuery.of(context).size.height * 0.03),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 500,
            width: 900,
            child: Image.asset(
              image,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            description,
            style:
                AppFonts.resumeText(MediaQuery.of(context).size.height * 0.02),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                if (url == "") {
                  return;
                } else {
                  launchUrl(Uri.parse(url!));
                }
              },
              child: Text('Saiba Mais'))
        ],
      ),
    );
  }
}
