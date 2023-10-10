import 'package:carburantapp/city_searched_page/city_searched_bindings.dart';
import 'package:carburantapp/city_searched_page/city_searched_page.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'CarburantApp',
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
          page: () => SettingsPage(),
          binding: SettingsBindings(),
        ),
        GetPage(
          name: '/citySearched',
          title: "Ville Recherché",
          page: () => const CitySearchedPage(),
          binding: CitySearchedBindings(),
        )
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
    );
  }
}
