// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/modules/home/widgets/section_button.dart';

typedef SectionCallback = void Function(int);

class MenuBar extends AppBar {
  final ValueChanged<int> onMenuClick;

  MenuBar({
    required this.onMenuClick,
    super.key,
  }) : super(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.only(
              left: 64,
            ),
            child: Text(
              'Felipe Sanches',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SectionButton(
                    onPressed: () => onMenuClick(1),
                    text: 'Home',
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SectionButton(
                    onPressed: () => onMenuClick(2),
                    text: 'Sobre',
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SectionButton(
                    onPressed: () => onMenuClick(3),
                    text: 'Projetos',
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SectionButton(
                    onPressed: () => onMenuClick(3),
                    text: 'Experiências',
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SectionButton(
                    onPressed: () => onMenuClick(3),
                    text: 'Contato',
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
          ],
        );
}
