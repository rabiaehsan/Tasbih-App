import 'package:flutter/material.dart';
import 'package:quizapp/quistions_screen.dart';
import 'package:quizapp/start_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activescreen ;
  @override
  void initState(){
    activescreen = Start_Screen(switchScreen);
    super.initState();
  }
  void switchScreen(){
    setState(() {
      activescreen = const MyHomePage(title: 'Tasbih',);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body:
               activescreen ,
        ),
        ),

    );
  }
}
