import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<int> snakePosition = [45, 65, 85, 105, 125];
  int numberOfSquares = 760;
  int food = Random().nextInt(700);
  var direction = 'down';

  void generateFood() {
    food = Random().nextInt(700);
  }

  void startGame() {
    const duration = Duration(milliseconds: 300);
    Timer.periodic(duration, (Timer timer) {
      updateSnake();
    });
  }

  void updateSnake() {
    setState(() {
      switch (direction) {
        case 'down':
          if (snakePosition.last > 740) {
            snakePosition.add(snakePosition.last + 20 - 760);
          } else {
            snakePosition.add(snakePosition.last + 20);
          }
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              // onVerticalDragUpdate: (details) {
              //   if (direction != 'up' && details.delta.dy > 0) {
              //     direction = 'down';
              //   } else if (direction != 'down' && details.delta.dy < 0) {
              //     direction = 'up';
              //   }
              // },
              // onHorizontalDragUpdate: (details) {
              //   if (direction != 'left' && details.delta.dx > 0) {
              //     direction = 'right';
              //   } else if (direction != 'right' && details.delta.dx < 0) {
              //     direction = 'left';
              //   }
              // },
              child: Container(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 20,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (snakePosition.contains(index)) {
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                    if (index == food) {
                      return Container(
                        padding: EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Colors.grey[900],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
