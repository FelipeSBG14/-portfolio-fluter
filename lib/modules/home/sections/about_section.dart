import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Row(
        children: [
          Column(
            children: [
              // FlutterCarousel(
              //   items: [
              //     Image.asset('assets/profile_image.png'),
              //     Image.asset('assets/profile_image2.png')
              //   ],
              //   options: CarouselOptions(
              //     autoPlay: true,
              //     controller: buttonCarouselController,
              //     enlargeCenterPage: true,
              //     viewportFraction: 0.9,
              //     aspectRatio: 2.0,
              //     initialPage: 1,
              //   ),
              // ),
              // ElevatedButton(
              //   onPressed: () => buttonCarouselController.nextPage(
              //       duration: Duration(milliseconds: 300),
              //       curve: Curves.linear),
              //   child: Text('→'),
              // )
            ],
          )
        ],
      ),
    );
  }
}
