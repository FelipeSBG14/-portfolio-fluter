import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/ui/colors/app_colors.dart';
import 'package:portfolio/ui/fonts/app_fonts.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 100),
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Prazer, eu sou Felipe Sanches',
                  style: AppFonts.titleName(
                    MediaQuery.of(context).size.height * 0.07,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Desenvolvedor Flutter',
                    style: AppFonts.titleFunction(
                      MediaQuery.of(context).size.height * 0.04,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    '''Sempre buscando me desenvolver no desenvolvimento de aplicações móveis, meu interesse na programação mobile existe desde o ensino médio. Estou sempre buscando me atualizar e melhorar minhas habilidades como completo, sou participativo e comunicativo e sempre empenhado em melhorar''',
                    style: AppFonts.resumeText(
                        MediaQuery.of(context).size.height * 0.018),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Entre em Contato',
                      style: AppFonts.buttonText(
                        MediaQuery.of(context).size.height * 0.030,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Image.asset('assets/profile_image.png'),
        ],
      ),
    );
  }
}
