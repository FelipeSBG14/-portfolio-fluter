import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/fonts/app_fonts.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 100),
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
                  child: DefaultTextStyle(
                    style: AppFonts.titleFunction(
                      MediaQuery.of(context).size.height * 0.04,
                    ),
                    textAlign: TextAlign.start,
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 2000),
                      animatedTexts: [
                        TypewriterAnimatedText('Desenvolvedor Flutter'),
                        TypewriterAnimatedText('Estudante'),
                        TypewriterAnimatedText('Entusiasta'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    '''Eu sou um desenvolvedor de aplicações móveis apaixonado e dedicado, e busco constantemente aprimorar minhas habilidades. Meu interesse em programação mobile surgiu no ensino médio e desde então venho me dedicando a aprofundar meu conhecimento na área.''',
                    style: AppFonts.resumeText(
                        MediaQuery.of(context).size.height * 0.020),
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
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/profile_image2.png')),
        ],
      ),
    );
  }
}
