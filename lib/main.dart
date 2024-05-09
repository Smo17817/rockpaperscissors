import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock, Paper, Scissors',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Text Style
  var scoreStyle = const TextStyle(color: Colors.white, fontSize: 25);
  var endStyle = const TextStyle(color: Colors.black, fontSize: 20);
  var labelStyle = const TextStyle(color: Colors.black, fontSize: 20);

  // Button Style
  var buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white, 
    shape: const CircleBorder(),
  );

  // Icon Style
  double iconDim = 40;
  double comImgDim = 200;
  var iconColor = Colors.grey[900];

  // Business Logic
  int randomValue = Random().nextInt(3);
  int pScore = 0;
  int comScore = 0;
  var path = 'lib/images/question.png';
  var results = 'Rock Paper Scissors';

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body:  Column(children: [
          // SCORE ROW
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Player', style: scoreStyle,),
                    Text(pScore.toString(), style: scoreStyle),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  children: [
                    Text('Computer', style: scoreStyle,),
                    Text(comScore.toString(), style: scoreStyle,),
                  ],
                ),
              ],
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Image.asset(path, width: comImgDim, color: Colors.white),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                  rockpaperscissors(0);
                  }, 
                  style: buttonStyle,
                  child: iconColumn('lib/images/rock.png'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                  rockpaperscissors(1);
                  }, 
                  style: buttonStyle, 
                  child: iconColumn('lib/images/paper.png')    
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                  rockpaperscissors(2);
                  }, 
                  style: buttonStyle,
                  child: iconColumn('lib/images/scissors.png'),
                       
                ),
              ],
            ),
          ),
        
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(results, style: scoreStyle,),
              ElevatedButton(
                onPressed: reset,
                child: Text('Reset Score', style: endStyle),
              )
            ],
          ),
        ],),

        
      )
    );
  }

  void reset(){
    setState(() {
        path = 'lib/images/question.png';
        results = 'Rock Paper Scissors';
        pScore = 0;
        comScore = 0;                    
    });
  }

  Column iconColumn(var path) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Image.asset(
          path, 
          color: iconColor,
          fit: BoxFit.scaleDown,
          width: iconDim,
        ),
        const SizedBox(height: 8),
      ],
    );
  }



  void rockpaperscissors(int value){
    setState((){

      randomValue = Random().nextInt(3);
      updatePath();

      if(
        value == 0 && randomValue == 2 || // Rock beats Scissors
        value == 1 && randomValue == 0 || // Paper beats Rock
        value == 2 && randomValue == 1    // Scissors beat Paper
      ){
        endDialog(0);
        pScore++;
      }

      if(
        value == 0 && randomValue == 1 ||
        value == 1 && randomValue == 2 || 
        value == 2 && randomValue == 0    
      ){
        endDialog(1);
        comScore++;
      }

      if(
        value == 0 && randomValue == 0 || 
        value == 1 && randomValue == 1 || 
        value == 2 && randomValue == 2   
      ){
        endDialog(2);
      }
    
  });
  
}

  void endDialog(int ending){
    var endings = ['YOU WIN', 'YOU LOSE', 'DRAW'];

    results = endings[ending];
  }

  void updatePath(){

    if(randomValue == 0){
      path = 'lib/images/rock.png';
    } else if (randomValue == 1){
      path = 'lib/images/paper.png';
    } else {
      path = 'lib/images/scissors.png';
    }
  }

}