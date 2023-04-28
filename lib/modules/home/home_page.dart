import 'package:flutter/material.dart';
import 'package:portfolio/modules/home/sections/about_section.dart';
import 'package:portfolio/modules/home/sections/contact_section.dart';
import 'package:portfolio/modules/home/sections/copy_right_section.dart';
import 'package:portfolio/modules/home/sections/experiences_section.dart';
import 'package:portfolio/modules/home/sections/home_section.dart';
import 'package:portfolio/modules/home/sections/projects_section.dart';
import 'package:portfolio/modules/home/widgets/menu_bar.dart';
import 'package:portfolio/modules/home/widgets/mobile_menu_bar.dart';
import 'package:portfolio/modules/home/widgets/section_button.dart';
import 'package:portfolio/responsive/responsive_layout.dart';
import 'package:portfolio/ui/colors/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  final keyHome = GlobalKey();
  final keyAbout = GlobalKey();
  final keyProjects = GlobalKey();
  final keyExperiences = GlobalKey();
  final keyContact = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: Scaffold(
          endDrawer: Drawer(
            backgroundColor: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SectionButton(
                    onPressed: () => _onMenuClick(1),
                    text: 'Home',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SectionButton(
                    onPressed: () => _onMenuClick(2),
                    text: 'Sobre',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SectionButton(
                    onPressed: () => _onMenuClick(3),
                    text: 'Projetos',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SectionButton(
                    onPressed: () => _onMenuClick(4),
                    text: 'Experiências',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SectionButton(
                    onPressed: () => _onMenuClick(5),
                    text: 'Contato',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: MobileMenuBar(
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
                  onMenuClick: _onMenuClick,
                ),
                AboutSection(
                  key: keyAbout,
                ),
                ProjectsSection(
                  key: keyProjects,
                ),
                ExperiencesSection(
                  key: keyExperiences,
                ),
                ContactSection(
                  key: keyContact,
                ),
                const CopyRightSection()
              ],
            ),
          ),
        ),
        desktopBody: Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
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
                  onMenuClick: _onMenuClick,
                ),
                AboutSection(
                  key: keyAbout,
                ),
                ProjectsSection(
                  key: keyProjects,
                ),
                ExperiencesSection(
                  key: keyExperiences,
                ),
                ContactSection(
                  key: keyContact,
                ),
                const CopyRightSection()
              ],
            ),
          ),
        ));
  }

  void _onMenuClick(int value) {
    final RenderBox renderBox;

    switch (value) {
      case 1:
        renderBox = keyHome.currentContext!.findRenderObject() as RenderBox;
        break;
      case 2:
        renderBox = keyAbout.currentContext!.findRenderObject() as RenderBox;
        break;
      case 3:
        renderBox = keyProjects.currentContext!.findRenderObject() as RenderBox;
        break;
      case 4:
        renderBox =
            keyExperiences.currentContext!.findRenderObject() as RenderBox;
        break;
      case 5:
        renderBox = keyContact.currentContext!.findRenderObject() as RenderBox;
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
