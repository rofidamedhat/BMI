// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
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
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result is :'),
      ),
    );
  }
}
