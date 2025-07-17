import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 60),

          Image.asset(
            'assets/images/islami.png',
            height: 130,
          ),

          const SizedBox(height: 40),

          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                height: 250,
              ),
            ),
          ),

           SizedBox(height: 30),

          Text(
            title,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 24,
              color: Color(0xffE2BE7F),
              fontWeight: FontWeight.bold,
            ),
          ),

           SizedBox(height: 15),

          Expanded(
            flex: 2,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: 20,
                color: Color(0xffE2BE7F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
