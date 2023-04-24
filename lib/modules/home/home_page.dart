import 'package:flutter/material.dart';
import 'package:portfolio/modules/home/sections/home_section.dart';
import 'package:portfolio/modules/home/widgets/menu_bar.dart';
import 'package:portfolio/modules/home/widgets/section_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  final scrollController = ScrollController();
  final keyHome = GlobalKey();
  final keySecao2 = GlobalKey();
  final keySecao3 = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 31, 72),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: MenuBar(
            onMenuClick: _onMenuClick,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            HomeSection(
              key: keyHome,
            ),
            SectionMenu(
              key: keySecao2,
              color: Colors.blue,
              height: 2000,
            ),
            SectionMenu(
              key: keySecao3,
              color: Colors.red,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void _onMenuClick(int value) {
    final RenderBox renderBox;

    switch (value) {
      case 1:
        renderBox = keyHome.currentContext!.findRenderObject() as RenderBox;
        break;
      case 2:
        renderBox = keySecao2.currentContext!.findRenderObject() as RenderBox;
        break;
      case 3:
        renderBox = keySecao3.currentContext!.findRenderObject() as RenderBox;
        break;
      default:
        throw Exception();
    }

    final offset = renderBox.localToGlobal(Offset.zero);
    final double appBarHeight = AppBar().preferredSize.height + 40;
    scrollController.animateTo(
      offset.dy - appBarHeight + scrollController.offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
