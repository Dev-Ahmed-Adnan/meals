import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  String? error;

  void _handleLogin() async {
    if (nameController.text.isEmpty || passwordController.text.isEmpty) {
      error = "Please fill missing fields!";
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("name", nameController.text);

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const CategoriesPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: "heroImage",
              // child: Container(
              //   width: 200,
              //   height: 200,
              //   color: Colors.blue,
              // ),
              child: Image.asset(
                "assets/logo2.png",
                width: double.infinity,
                height: 300,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              "Welcome to Meals App!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                label: Text(
                  "Password",
                  style: TextStyle(color: Colors.white),
                ),
                hintStyle: TextStyle(color: Colors.white),
              ),
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return "Please Enter Name!";
              //   } else {
              //     return null;
              //   }
              // },
            ),
            // Text(nameController.text),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                label: Text(
                  "Password",
                  style: TextStyle(color: Colors.white),
                ),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            if (error != null) ...[
              const SizedBox(height: 20),
              Text(
                error!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ],
            const SizedBox(height: 70),
            OutlinedButton(
              onPressed: _handleLogin,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
