import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DiceGame extends StatefulWidget {
  final like=0;
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  final random=Random.secure();
  final dices=const[
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',
  ];
  int index1=0;
  int index2=0;
  int score=0;
  int yourScore=0;
  int highestScore=0;
  bool gameOver=false;
  bool loose=true;
  bool hasStarted=false;
  bool hasRolled=false;

  void _rollDice(){
    setState(() {
      if(gameOver){
        gameOver=false;
      }
      if(!hasRolled)
        hasRolled=true;
      index1=random.nextInt(6);
      index2=random.nextInt(6);
      score+=index1+index2+2;
      if(index1+index2+2==7){
        gameOver=true;
        yourScore=score;
        if(yourScore>=highestScore){
          loose=false;
          highestScore=yourScore;
        }else{
          loose=true;
        }
        score=0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            if(!gameOver&&hasStarted)Text('Score: $score',style: TextStyle(
              color: Colors.amber.shade900,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
            if(gameOver&&hasStarted)Column(
              children: [
                if(loose)Text(
                    'Not so lucky!',
                    style: TextStyle(
                        color: Colors.redAccent.shade700,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    )
                ),
                if(!loose)Text(
                    'Lucky! Highest Score!',
                    style: TextStyle(
                        color: Colors.greenAccent.shade700,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    )
                ),
                Text('Your Score: $yourScore',style: TextStyle(
                      color: Colors.amber.shade900,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                ),
                Text('Highest Score: $highestScore',style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            if(hasRolled)SizedBox(height: 40,),
            if(hasRolled)Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Image.asset(dices[index2],width: 120, height: 120, fit: BoxFit.fitHeight,),
                SizedBox(width: 20,),

                Image.asset(dices[index1],width: 120, height: 120, fit: BoxFit.fitHeight,),
              ],
            ),
            if(hasStarted)SizedBox(height: 50,),
            if(hasStarted)ElevatedButton(onPressed: _rollDice, child: Text(
                'Roll',
              style: TextStyle(fontSize: 25),
            ),style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber.shade900),
              padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(70, 5, 70, 5))
            ),
            ),
            if(!hasStarted)MaterialButton(
              onPressed: () {
                setState(() {
                  hasStarted=true;
                  gameOver=false;
                });
              },
              color: Colors.redAccent.shade700,
              textColor: Colors.white,
              child: Text(
                'Start',
                style: TextStyle(fontSize: 25),
              ),
              padding: EdgeInsets.all(50),
              shape: CircleBorder(),
            )

          ],
        ),
      ),
    );
  }
}
