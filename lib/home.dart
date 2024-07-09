import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = false;
  String selectedGender = 'Female';
  double chosenHeight = 150.0;
  int selectedWeight = 50;
  int selectedAge = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _genderType('Male'),
                _genderType('Female'),
              ],
            ),
            const SizedBox(height: 20),
            _calcHeight(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _controlWeightAndAge(context, 'Weight'),
                _controlWeightAndAge(context, 'Age'),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
              ),
              height: 60,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Result(
                        genderType: selectedGender,
                        selectedHeight: chosenHeight,
                        selectedWeight: selectedWeight,
                        selectedAge: selectedAge,
                      ),
                    ),
                  );
                },
                color: Colors.teal,
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderType(String type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMale = type == 'Male' ? true : false;
          selectedGender = type;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .22,
        width: MediaQuery.of(context).size.height * .22,
        decoration: BoxDecoration(
          color: (isMale && type == 'Male') ||
                  (isMale == false && type == 'Female')
              ? Colors.teal
              : Colors.blueGrey,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(type == 'Male' ? Icons.male : Icons.female,
                size: MediaQuery.sizeOf(context).height * .1),
            Text(
              type == 'Male' ? 'Male' : 'Female',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _calcHeight() {
    return Container(
      height: MediaQuery.sizeOf(context).height * .25,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(
            25,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Height',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${chosenHeight.toStringAsFixed(1)} ',
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'CM',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Slider(
            value: chosenHeight,
            onChanged: (val) {
              setState(() {
                chosenHeight = val;
              });
            },
            min: 90,
            max: 220,
          ),
        ],
      ),
    );
  }

  Widget _controlWeightAndAge(BuildContext context, String type) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * .22,
      width: MediaQuery.of(context).size.height * .22,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == 'Weight' ? 'Weight' : 'Age',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          Text(
            type == 'Weight' ? '$selectedWeight' : '$selectedAge',
            style: const TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  setState(() {
                    type == 'Weight' ? selectedWeight++ : selectedAge++;
                  });
                },
                heroTag:
                    type == 'Weight' ? 'selectedWeight++' : 'selectedAge++',
                backgroundColor: Colors.teal,
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  setState(() {
                    type == 'Weight' ? selectedWeight-- : selectedAge--;
                  });
                },
                heroTag:
                    type == 'Weight' ? 'selectedWeight--' : 'selectedAge--',
                backgroundColor: Colors.teal,
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
