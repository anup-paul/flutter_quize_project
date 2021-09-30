import 'package:flutter/material.dart';
import 'package:flutter_quize_project/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.orange[900],
            centerTitle: true,
            title: Text("Let's play a quize test"),
          ),
          body: quizeScreen(),
        ),
      ),
    );
  }
}

class quizeScreen extends StatefulWidget {
  const quizeScreen({Key? key}) : super(key: key);

  @override
  _quizeScreenState createState() => _quizeScreenState();
}

class _quizeScreenState extends State<quizeScreen> {
  List<Icon> scoreKeeper = [];

  List<String> questions = [
    "React is a Javascript Library",
    "Array and List are same in flutter",
    "Flutter using by Dart",
    "React is a Javascript Library",
    "Array and List are same in flutter",
    "Flutter using by Dart",
  ];

  List<bool> answers = [true, false, true, false, false, true];

  List<Question> questionBank = [
    Question(q: "React is a Javascript Library", a: true),
    Question(q: "Array and List are same in flutter", a: false),
    Question(q: "Flutter using by Dart", a: true),
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  questions[questionNumber],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(40, 50), primary: Colors.green[900]),
                    onPressed: () {
                      bool corretAnswer = answers[questionNumber];
                      if (corretAnswer == true) {
                        print("True");
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      } else {
                        print("False");
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      }

                      setState(() {
                        questionNumber++;
                        // scoreKeeper.add(Icon(
                        //   Icons.check,
                        //   color: Colors.green,
                        // ));
                      });
                    },
                    child: Text(
                      "True",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(40, 50), primary: Colors.red[900]),
                    onPressed: () {
                      bool corretAnswer = answers[questionNumber];
                      if (corretAnswer == false) {
                        print("true");
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      } else {
                        print("false");
                        scoreKeeper.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      }

                      setState(() {
                        questionNumber++;
                        // scoreKeeper.add(Icon(
                        //   Icons.close,
                        //   color: Colors.red,
                        // ));
                      });
                    },
                    child: Text(
                      "False",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ],
      ),
    );
  }
}
