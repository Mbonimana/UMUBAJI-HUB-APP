import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Umubaji Hub App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  // Fake login for offline preview
  Future<void> login() async {
    setState(() => isLoading = true);

    await Future.delayed(Duration(seconds: 1));

    if (emailController.text == "test@umubaji.com" &&
        passwordController.text == "123456") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email or password")),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Umubaji Hub Login')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                isLoading
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: login,
                          child: Text('Login'),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home - Umubaji Hub')),
      body: Center(
        child: Text(
          'Welcome to Umubaji Hub!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
