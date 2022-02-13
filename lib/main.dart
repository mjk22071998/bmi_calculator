import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int currentIndex = 0;
  Color primary = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: const Text("BMI Calculator"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    radioButton("Male", Colors.blue, 0),
                    radioButton("Female", Colors.pink, 1),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Your height in cms",
                      filled: true,
                      fillColor: Colors.grey[200]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
      primary = currentIndex == 0 ? Colors.blue : Colors.pink;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ElevatedButton(
        onPressed: () {
          changeIndex(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            value,
            style: TextStyle(
                color: (currentIndex == index) ? Colors.white : color,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: (currentIndex == index) ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    ));
  }
}
