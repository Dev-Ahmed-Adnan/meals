import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    _checkLogin();
  }

  void _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString("name");
    Future.delayed(const Duration(seconds: 2), () {
      if (name != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => const CategoriesPage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (ctx) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "heroImage",
          child: Image.asset(
            "assets/logo2.png",
            width: double.infinity,
            height: 300,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
