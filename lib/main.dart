import 'package:carburantapp/home_page.dart';
import 'package:carburantapp/recherche_page/recherche_bindings.dart';
import 'package:carburantapp/recherche_page/recherche_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CarburantApp',
      getPages: [
        GetPage(
          name: '/search',
          title: 'Page de recherche',
          page: () => const RecherchePage(),
          binding: RechercheBindings(),
        ),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
