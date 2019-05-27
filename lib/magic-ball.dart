import 'dart:math';

import 'package:flutter/material.dart';

class MagicBall extends StatefulWidget {
  final Widget title;

  MagicBall({this.title}) {}

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int answer = 1;

  void getAnswer() {
    setState(() {
      int nextAnswer;

      do {
        nextAnswer = Random.secure().nextInt(5) + 1;
      } while (nextAnswer == answer);

      answer = nextAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Nice to meet you, i am',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blue[200],
            ),
          ),
          widget.title,
          Text(
            'Ask me anything',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue[200],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            onPressed: getAnswer,
            child: Image.asset('images/ball$answer.png'),
          )
        ],
      ),
    );
  }
}
