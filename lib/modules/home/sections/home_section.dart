import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:portfolio/modules/home/widgets/social_button.dart';
import 'package:portfolio/ui/fonts/app_fonts.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

bool isHover = false;

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
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
                const SizedBox(
                  height: 200,
                ),
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
                ),
                const SizedBox(
                  height: 150,
                ),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Row(
                    children: const [
                      SocialButton(
                          icon: Entypo.linkedin,
                          url: 'https://www.linkedin.com/in/felipesbg/'),
                      SocialButton(
                        icon: Entypo.github,
                        url: 'https://github.com/FelipeSBG14',
                      ),
                      SocialButton(
                        icon: Entypo.instagram,
                        url: 'https://www.instagram.com/felipesbg.apk/',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () => {},
            enableFeedback: false,
            excludeFromSemantics: true,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            mouseCursor: MouseCursor.uncontrolled,
            onHover: (value) => setState(() {
              isHover = value;
            }),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                opacity: isHover ? 0.3 : 1,
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  'assets/profile_image2.png',
                  opacity: const AlwaysStoppedAnimation(.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
