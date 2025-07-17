import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Home Screen')),
      ),
    );
  }
}
