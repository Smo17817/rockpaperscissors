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

  var scoreStyle = const TextStyle(color: Colors.white, fontSize: 30);
  var endStyle = const TextStyle(color: Colors.black, fontSize: 30);
  var labelStyle = const TextStyle(color: Colors.black, fontSize: 20);
  int randomValue = Random().nextInt(3);
  int pScore = 0;
  int comScore = 0;
  var path = 'lib/images/question.png';
  double iconDim = 50;
  double comImgDim = 200;

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body:  Column(children: [
          // SCORE ROW
          Row(
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
      
          Padding(
            padding: const EdgeInsets.all(100),
            child: Image.asset(path, width: comImgDim, color: Colors.white),
          ),

          Padding(
            padding: const EdgeInsets.all(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                  rockpaperscissors(0);
                  }, 
                  icon: Image.asset(
                    'lib/images/rock.png', 
                    color: Colors.black,
                    fit: BoxFit.scaleDown,
                    width: iconDim,
                  ),
                  label: Text('Rock', style: labelStyle),      
                ),
                const SizedBox(width: 30),
                ElevatedButton.icon(
                  onPressed: () {
                  rockpaperscissors(1);
                  }, 
                  icon: Image.asset(
                    'lib/images/paper.png', 
                    color: Colors.black,
                    fit: BoxFit.scaleDown,
                    width: iconDim,
                  ),
                  label: Text('Paper', style: labelStyle),      
                ),
                const SizedBox(width: 30),
                ElevatedButton.icon(
                  onPressed: () {
                  rockpaperscissors(2);
                  }, 
                  icon: Image.asset(
                    'lib/images/scissors.png', 
                    color: Colors.black,
                    fit: BoxFit.scaleDown,
                    width: iconDim,
                  ),
                  label: Text('Scissors', style: labelStyle),      
                ),
              ],
            ),
          ),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Rock Paper Scissors', style: scoreStyle,),
            ],
          ),
        ],),

        
      )
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

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(endings[ending], style: endStyle,),
          actions: <Widget>[
            ElevatedButton(
              onPressed: Navigator.of(context).pop, // deletes the barrier
              child: Text('Play Again', style: endStyle,),
            ),
          ],  
        );
      }
    );
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





