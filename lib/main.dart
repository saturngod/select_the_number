import 'dart:math';

import 'package:flutter/material.dart';

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
            Column(
                children: images
                    .map((val) => InkWell(
                          onTap: () {
                            var message = "Your answer is wrong";
                            var ansColors = Colors.red;
                            if (correctAnswer == val) {
                              message = "Your answer is correct";
                              ansColors = Colors.green;
                              setState(() {
                                score += 10;
                              });
                            } else {
                              setState(() {});
                            }

                            final snackBar = SnackBar(
                              content: Text(message),
                              duration: const Duration(seconds: 1),
                              backgroundColor: ansColors,
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }, // Handle your callback.
                          child: Ink(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/$val.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ))
                    .toList()),
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
