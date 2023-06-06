import 'package:flutter/material.dart';
import 'package:quizapp/quistions_screen.dart';

class Start_Screen extends StatefulWidget {
  const Start_Screen(void Function() switchScreen, {Key? key}) : super(key: key);

  @override
  State<Start_Screen> createState() => _Start_ScreenState();
}

class _Start_ScreenState extends State<Start_Screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:

        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),

              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child:  Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                    opacity: 0.5,
                    child: Image.asset('images/tasbih.png',width: 200,)),
                const SizedBox(
                  height: 30,
                ),
                const Opacity(
                    opacity: 0.5,
                    child:  Text('A Dua A Day Tasbih !', style: TextStyle(fontSize: 18 ,color: Colors.white),)),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Tasbih',)));
                },style: ElevatedButton.styleFrom(
                    elevation: 6,
                    foregroundColor:const Color(0xFFFFFFFF),
                    backgroundColor: const Color(0xFF540099)

                ), label:const Text('Start',selectionColor: Colors.white,),
                  icon:const Icon(Icons.arrow_right_alt),
                )
              ],
            ),
          ),
        ),


      );
  }
}

