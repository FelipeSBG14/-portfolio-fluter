import 'package:flutter/material.dart';
import 'package:portfolio/ui/portfolio_ui_config.dart';

import 'core/env/env.dart';
import 'modules/home/home_page.dart';

void main() async {
  await Env.i.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //TESTE
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Porifólio',
      initialRoute: '/',
      theme: PortfolioUiConfig.theme,
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
