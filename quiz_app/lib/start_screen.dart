import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 180,
            color: const Color.fromARGB(255, 0, 32, 23),
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            'Flutter Quiz: Test your knowlegde!',
            style: GoogleFonts.poppins(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 0, 32, 23),
            ),
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.poppins(),
            ),
          )
        ],
      ),
    );
  }
}
