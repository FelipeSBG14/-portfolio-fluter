import 'package:flutter/material.dart';
import 'package:portfolio/ui/colors/app_colors.dart';
import 'package:portfolio/ui/fonts/app_fonts.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundAbout,
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * .9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Sobre',
              style: AppFonts.aboutText(
                MediaQuery.of(context).size.height * 0.05,
                Colors.white,
              ),
              children: [
                TextSpan(
                  text: ' Mim',
                  style: AppFonts.aboutText(
                    MediaQuery.of(context).size.height * 0.05,
                    AppColors.secColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: _animation,
                child: ClipPath(
                  clipper: const ShapeBorderClipper(
                      shape: CircleBorder(side: BorderSide(width: 10))),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.32,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: AppColors.secColor),
                        bottom: BorderSide(color: AppColors.secColor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/profile_image.png"),
                        fit: BoxFit.fitHeight,
                      ),
                      border: Border.all(width: 2, color: AppColors.secColor),
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              '''Estudante de graduação em Engenharia de Computação na Universidade Federal do Mato Grosso do Sul. 

Desde o ensino médio estive envolvido com desenvolvimento mobile. Participei da FETEC MS ficando em quarto lugar com o aplicativo feito por mim intitulado de "ENGLISH SPEAKER". Aplicativo feito após o curso DESTACOM elaborado pela UFMS utilizando a plataforma APP INVENTOR 2. 

Atualmente sou desenvolvedor mobile dentro da empresa júnior de computação da UFMS, a Mega Jr, bem como, sou estagiário na Oliveira & Rae Engenharia nesse mesmo cargo, desenvolvendo aplicações para a automatização de fiscalização de rodovias. 

Sempre gostei muito da área mobile e atualmente utilizo o Flutter em minhas criações, porém, sou flexível e interessado em aprender cada vez mais áreas''',
              style: AppFonts.resumeText(
                MediaQuery.of(context).size.height * 0.020,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
