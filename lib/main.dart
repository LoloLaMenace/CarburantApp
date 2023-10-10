import 'package:carburantapp/home_page/home_bindings.dart';
import 'package:carburantapp/home_page/home_page.dart';
import 'package:carburantapp/search_page/search_bindings.dart';
import 'package:carburantapp/search_page/search_page.dart';
import 'package:carburantapp/settings_page/settings_bindings.dart';
import 'package:carburantapp/settings_page/settings_page.dart';
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
      title: 'Flutter Demo',
      getPages: [
        GetPage(
          name: '/search',
          title: 'Page de recherche',
          page: () => const SearchPage(),
          binding: SearchBindings(),
        ),
        GetPage(
          name: '/home',
          title: "Page d'accueil",
          page: () => const HomePage(),
          binding: HomeBindings(),
        ),
        GetPage(
          name: '/settings',
          title: "Paramètres",
          page: () => const SettingsPage(),
          binding: SettingsBindings(),
        )
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
    );
  }
}
