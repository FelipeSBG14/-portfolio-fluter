// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

typedef SectionCallback = void Function(int);

class MobileMenuBar extends AppBar {
  final ValueChanged<int> onMenuClick;

  MobileMenuBar({
    required this.onMenuClick,
    super.key,
  }) : super(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.only(),
            child: Text(
              'Felipe Sanches',
            ),
          ),
        );
}
