import 'package:flutter/material.dart';
import 'package:portfolio/modules/home/widgets/experience_tile.dart';
import 'package:portfolio/ui/colors/app_colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../ui/fonts/app_fonts.dart';

class ExperiencesSection extends StatelessWidget {
  const ExperiencesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundAbout,
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * .9,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RichText(
          text: TextSpan(
            text: 'Minha',
            style: AppFonts.aboutText(
              MediaQuery.of(context).size.height * 0.05,
              Colors.white,
            ),
            children: [
              TextSpan(
                text: ' Trajetória',
                style: AppFonts.aboutText(
                  MediaQuery.of(context).size.height * 0.05,
                  AppColors.secColor,
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 800,
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.height * 0.35),
            width: MediaQuery.of(context).size.width * 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 800,
                    width: 1000,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Educação',
                          style: AppFonts.titleName(
                              MediaQuery.of(context).size.height * 0.015),
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.center,
                          isFirst: true,
                          indicatorStyle: const IndicatorStyle(
                            width: 20,
                            color: AppColors.secColor,
                            indicatorXY: 0.2,
                            padding: EdgeInsets.all(8),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: AppColors.secColor,
                          ),
                          endChild: const ExperienceTile(
                            date: '2018 - 2020',
                            jobTittle: 'Ensino Médio - Colégio Status',
                            jobDescription:
                                'Aqui foi onde eu tive a oportunidade de ter meus primeiros contatos com programação e também participar do DESTACOM, onde eu desenvolvi o "English Speaker", minha primeira aplicação mobile',
                          ),
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.center,
                          isFirst: false,
                          isLast: true,
                          indicatorStyle: const IndicatorStyle(
                            width: 20,
                            color: AppColors.secColor,
                            indicatorXY: 0.2,
                            padding: EdgeInsets.all(8),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: AppColors.secColor,
                          ),
                          endChild: const ExperienceTile(
                            date: '2021 - 2023',
                            jobTittle: 'Engenharia de Computação - UFMS',
                            jobDescription:
                                'Aqui é onde eu estou sendo diretor da empresa júnior e apendendo muito sobre computação de modo geral, para poder ser um profissional completo e competente',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 800,
                    width: 1000,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Experiência',
                          style: AppFonts.titleName(
                              MediaQuery.of(context).size.height * 0.015),
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.center,
                          isFirst: true,
                          indicatorStyle: const IndicatorStyle(
                            width: 20,
                            color: AppColors.secColor,
                            indicatorXY: 0.2,
                            padding: EdgeInsets.all(8),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: AppColors.secColor,
                          ),
                          endChild: const ExperienceTile(
                            date: '2021 - 2023',
                            jobTittle: 'Flutter Developer - Mega Jr',
                            jobDescription:
                                'Na empresa júnior de computação da UFMS, a Mega Jr, foi onde eu aprendi a base do Flutter e me apaixonei pelo framework',
                          ),
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.center,
                          isFirst: false,
                          isLast: false,
                          indicatorStyle: const IndicatorStyle(
                            width: 20,
                            color: AppColors.secColor,
                            indicatorXY: 0.2,
                            padding: EdgeInsets.all(8),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: AppColors.secColor,
                          ),
                          endChild: const ExperienceTile(
                            date: '2022 - 2023',
                            jobTittle: 'Web Developer - Oliveira & Rae',
                            jobDescription:
                                'Nessa empresa fui contratado para cuidar de um sistema web, feito em vue, foi onde eu tive meu primeiro contato real com desenvolvimento web',
                          ),
                        ),
                        TimelineTile(
                          alignment: TimelineAlign.center,
                          isFirst: false,
                          isLast: true,
                          indicatorStyle: const IndicatorStyle(
                            width: 20,
                            color: AppColors.secColor,
                            indicatorXY: 0.2,
                            padding: EdgeInsets.all(8),
                          ),
                          beforeLineStyle: const LineStyle(
                            color: AppColors.secColor,
                          ),
                          endChild: const ExperienceTile(
                            date: '2022 - 2023',
                            jobTittle: 'Flutter Developer - Oliveira & Rae',
                            jobDescription:
                                'Durante meu tempo como desenvolvedor web surgiram demandas de uma aplicação mobile, o "Road View", e foi ai que fui para o cargo de desenvolvedor Flutter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ]),
    );
  }
}
