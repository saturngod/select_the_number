import 'dart:math';

import 'package:flutter/material.dart';
import 'package:selectnumber/components/image_btn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select the Number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectNumber(),
    );
  }
}

class SelectNumber extends StatefulWidget {
  SelectNumber({Key? key}) : super(key: key);

  @override
  State<SelectNumber> createState() => _SelectNumberState();
}

class _SelectNumberState extends State<SelectNumber> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int correctAnswer = 0;
  int score = 0;

  Widget imageList(List<int> images) => Column(
      children: images
          .map((val) => ImageButton(
              correctAnswer: correctAnswer,
              val: val,
              onTap: (ans) {
                setState(() {
                  score += ans;
                });
              }))
          .toList());

  @override
  Widget build(BuildContext context) {
    numbers.shuffle();
    List<int> images = numbers.sublist(0, 3);
    correctAnswer = images[0];
    images.shuffle();

    return Scaffold(
      appBar: AppBar(title: const Text("Select Number")),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Select the number $correctAnswer"),
            imageList(images),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text("Refresh"),
            ),
            Text("Score is $score")
          ],
        ),
      ),
    );
  }
}
