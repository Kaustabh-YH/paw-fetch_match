import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';
import 'features/pet_adoption/presentation/view/pet_adoption_listing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawFetch Match',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        fontFamily: AppStyle.shared.getDefaultFontFamily(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const PetAdoptionListingPage(),
    );
  }
}
