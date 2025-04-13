import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start_screen';

  @override
  void initState() {
    //All initialisation must be here
    // activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(
      () {
        activeScreen = 'questions_screen';
      },
    );
  }


  void switchHome(){
    setState(() {
      selectedAnswers=[];
      activeScreen='start_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,switchHome: switchHome,
      );
    }

    if(activeScreen=='start_screen'){
      screenWidget=StartScreen(switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 193, 255, 252),
                Color.fromARGB(255, 224, 255, 253),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
