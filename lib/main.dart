import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/store/favorites_provider.dart';
import 'package:provider/provider.dart';
// import 'package:meals/screens/meals_list.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 163, 25, 15));
var kDarkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 168, 126, 20));

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => FavoriteProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: kColorScheme.onBackground,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: kColorScheme.primary,
          unselectedItemColor: kColorScheme.onPrimary,
        ),
        textTheme: GoogleFonts.latoTextTheme().copyWith(
          titleLarge: const TextStyle(color: Colors.white),
        ),
      ),
      home: const CategoriesPage(),
    );
  }
}
