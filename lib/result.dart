import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String genderType;
  final double selectedHeight;
  final int selectedWeight;
  final int selectedAge;
  const Result({
    Key? key,
    required this.genderType,
    required this.selectedHeight,
    required this.selectedWeight,
    required this.selectedAge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender : $genderType',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Healthiness : ${healthOfBMI(caclcBMI())}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Result : ${caclcBMI().toStringAsFixed(1)}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Age : $selectedAge',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double caclcBMI() {
    final heightInMeters = selectedHeight / 100;
    final result = selectedWeight / (heightInMeters * heightInMeters);
    return result;
  }

  String healthOfBMI(double result) {
    if (result <= 18.5) {
      return 'UnderWeight';
    } else if (result > 18.5 && result <= 24.5) {
      return 'Normal';
    } else if (result >= 25 && result <= 29.5) {
      return 'OverWeight';
    } else {
      return 'obese';
    }
  }
}
