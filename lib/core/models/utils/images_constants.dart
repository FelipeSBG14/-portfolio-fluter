import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/core/models/widgets/carousel_image.dart';

class ImagesConstants {
  static List<Widget> images = [
    const CarouselImage(
      title: 'Vakinha Burguer',
      image: 'assets/projects/vakinha_burguer.jpg',
      description:
          'Aplicativo de delivery desenvolvido durante o DartWeek da Academia do Flutter',
      'https://www.linkedin.com/posts/felipesbg_dartweek-flutterdevelopment-aprendizadocontinuo-activity-7028908740993032192-1L8Q?utm_source=share&utm_medium=member_desktop',
    ),
    const CarouselImage(
      title: 'Road View',
      image: 'assets/projects/road_view.jpg',
      description: 'Aplicativo para monitoramento de rodovias',
      '',
    ),
    const CarouselImage(
      title: 'Educapi',
      image: 'assets/projects/educapi.jpg',
      description:
          'Aplicativo feito durante um edital da UFMS incentivando a sustentabilidade.',
      'https://www.linkedin.com/posts/felipesbg_empresas-sustentabilidade-designers-activity-7019381738736861185-eoWz?utm_source=share&utm_medium=member_desktop',
    ),
    const CarouselImage(
      title: 'To Do List',
      image: 'assets/projects/todo_list.png',
      description: 'Aplicativo que marca afazeres a serem feitos e concluidos',
      '',
    ),
    const CarouselImage(
      title: 'English Speaker',
      image: 'assets/projects/english_speaker.jpg',
      description:
          'Meu prmeiro aplicativo desenvolvido. Aplicação feita no "App Inventor 2" para ajudar no ensino de inglês',
      'https://destacom.ufms.br/2018/06/29/primeira-turma-de-2018/',
    ),
    const CarouselImage(
      title: 'Site Portifólio',
      image: 'assets/projects/portifolio.jpg',
      description: 'Esse site de portifolio que foi feito 100% em Flutter !',
      '',
    ),
  ];
}
