import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMR Calculator"),
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController gender = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController answer = TextEditingController();
  double calories = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/bmr.jpg',
                  width: 200,
                ),
                Text(
                  'Basal Metabolic Rate (BMR) \nis the number of calories you burn as your body performs basic life-sustaining function',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                TextField(
                  controller: gender,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender(Men/Women)',
                      hintText: 'Enter your gender(Men/Women)'),
                ),
                TextField(
                  controller: weight,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Weight(kg)',
                      hintText: 'Enter your weight(kg)'),
                ),
                TextField(
                  controller: height,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Height(cm)',
                      hintText: 'Enter your Height(cm)'),
                ),
                TextField(
                  controller: age,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age',
                      hintText: 'Enter your age'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (gender.text == "Men" || gender.text == 'men') {
                      calories = 88.362 +
                          (13.397 * double.parse(weight.text) +
                              (4.799 * double.parse(height.text) -
                                  (5.677 * double.parse(age.text))));
                    } else if (gender.text == "Women" ||
                        gender.text == 'women') {
                      calories = 447.593 +
                          (9.247 * double.parse(weight.text) +
                              (3.098 * double.parse(height.text) -
                                  (4.33 * double.parse(age.text))));
                    }
                    setState(() {
                      answer.text =
                          //'Gender : ${gender.text}\nWeight: ${weight.text}\nHeight: ${height.text}\nAge: ${age.text}\nYour BMR is ${calories.toStringAsFixed(2)}';
                          'Your BMR is ${calories.toStringAsFixed(2)}';
                    });

                    print(
                        'Gender : ${gender.text}\nWeight: ${weight.text}\nHeight: ${height.text}\nAge: ${age.text}\nYour BMR is ${calories.toStringAsFixed(2)}');
                  },
                  child: Text('calculate'),
                  style: ButtonStyle(),
                ),
                Text(
                  answer.text,
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
