import 'dart:async';

import 'package:courage_the_cowardly_dog/barriers.dart';
import 'package:courage_the_cowardly_dog/courage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double courageYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = courageYaxis;
  bool gameHasStarted = false;
  static double barrierX1 = 1;
  double barrierX2 = barrierX1 + 1.5;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = courageYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      time += 0.06;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        courageYaxis = initialHeight - height;
        // barrierX1 -= 0.05;
        // barrierX2 -= 0.05;
      });
      setState(() {
        if (barrierX1 < -2) {
          barrierX1 += 3.5;
        } else {
          barrierX1 -= 0.05;
        }
      });
      setState(() {
        if (barrierX2 < -2) {
          barrierX2 += 3.5;
        } else {
          barrierX2 -= 0.05;
        }
      });
      if (courageYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, courageYaxis),
                      duration: Duration(milliseconds: 0),
                      color: Color.fromARGB(255, 49, 2, 58),
                      child: MyCourage(),
                    ),
                    Container(
                      alignment: Alignment(0, -0.3),
                      child: gameHasStarted
                          ? Text(" ")
                          : Text(
                              "T A P  T O  P L A Y",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierX1, 1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierX1, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierX2, 1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierX2, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyBarrier(
                        size: 200.0,
                      ),
                    ),
                  ],
                )),
            Container(
              height: 15,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            Expanded(
              child: Container(
                color: Color.fromARGB(255, 90, 27, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Score",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Best",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "10",
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // void showDialog(){

  // }
}
