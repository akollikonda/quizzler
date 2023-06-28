import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  Map<String, bool> questions = {
    "Data engineering involves building data pipelines and ensuring data quality.":
        true,
    "Python is a statically typed programming language.": false,
    "Apache Kafka is a distributed streaming platform.": true,
    "Data visualization is the process of analyzing raw data to extract insights.":
        false,
    "AWS Lambda is a serverless computing service provided by Microsoft Azure.":
        false,
    "Tableau is a popular business intelligence and data visualization tool.":
        true,
    "ETL stands for Extract, Transform, Load and is a process used in data integration.":
        true,
    "MySQL is an open-source relational database management system.": true,
    "Machine learning is a subfield of artificial intelligence that focuses on computer algorithms.":
        true,
    "Power BI is a cloud-based data visualization tool developed by Google.":
        false,
  };

  int questionNum = 0;
  int score = 0;

  Widget trueIcon = const Icon(
    Icons.check,
    color: Colors.green,
  );

  Widget falseIcon = const Icon(
    Icons.close,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions.keys.toList()[questionNum],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (questions.values.toList()[questionNum] == true) {
                  setState(() {
                    score += 1;
                    scoreKeeper.add(trueIcon);
                    questionNum++;
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(falseIcon);
                    questionNum++;
                  });
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (questions.values.toList()[questionNum] == false) {
                  setState(() {
                    score += 1;
                    scoreKeeper.add(trueIcon);
                    questionNum++;
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(falseIcon);
                    questionNum++;
                  });
                }
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: scoreKeeper),
            Text(
              'Score = $score',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
