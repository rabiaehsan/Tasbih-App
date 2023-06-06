import 'package:flutter/material.dart';
import 'package:quizapp/ripple.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool _iconBool = false;
IconData  _iconlight = Icons.wb_sunny;
IconData  _icondark= Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
      brightness: Brightness.light
);
ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark
);

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;

  int _counter = 0;

  @override
  void initState() {

    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 4) );
    _animation = Tween(begin: 2.0,end: 10.0).animate(_animationController);
    _animationController.addListener(() {

    });
    _animationController.forward();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  void _refresh() {
    setState(() {
      _counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var listRadius = [150.0,200.0,250.0,300.0,350.0];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? _darkTheme : _lightTheme,

      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Tasbih',style: TextStyle(fontStyle: FontStyle.italic),),
          ),
          actions: [
            IconButton(onPressed: (){
              setState(() {
                _iconBool = !_iconBool;
              });
             },
                icon: Icon(_iconBool ? _icondark:_iconlight))
          ],
                ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Container(),
            ],

          ),
        ),


        floatingActionButton: Padding(
          padding: const EdgeInsets.all(14),
          child:Stack(

            children: [
              Padding(
                padding: const EdgeInsets.all(27),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height:3,
                    width: 3,
                    child: const HomePage(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 100, 200, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 10,
                    width: 10,
                    child: const HomePage(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: SizedBox(
                    height: 60,
                    width: 70,

                    child: FittedBox(
                      child: FloatingActionButton(onPressed:_decrementCounter,child: const Icon(Icons.remove),

                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  width: 80,
                  child: FittedBox(
                    child: FloatingActionButton(onPressed: _refresh,child:
                    const Icon(Icons.refresh),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 60,
                  width: 70,
                  child: FittedBox(
                    child: FloatingActionButton(onPressed:_incrementCounter,child: const Icon(Icons.add),

                    ),
                  ),
                ),

              ),

            ],
            
          ),
          
        ),
        
      ),
     
    );
  }
}

