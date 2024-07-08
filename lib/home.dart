import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                _containerWidget(
                    context, _genderType(context, Icons.male, 'Male')),
                _containerWidget(
                    context, _genderType(context, Icons.female, 'Female')),
              ],
            ),
            const SizedBox(height: 20),
            Container(
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
              child: _calcHeight(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _containerWidget(context, _controlWeightAndAge('Weight', '60')),
                _containerWidget(context, _controlWeightAndAge('Age', '50')),
              ],
            ),
            const SizedBox(height: 15),
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
                      builder: (context) => const Result(),
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

  _containerWidget(BuildContext context, Widget contentWidget) {
    return Container(
      height: MediaQuery.of(context).size.height * .22,
      width: MediaQuery.of(context).size.height * .22,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(
            25,
          ),
        ),
      ),
      child: contentWidget,
    );
  }

  Widget _genderType(BuildContext context, IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, size: MediaQuery.sizeOf(context).height * .1),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _controlWeightAndAge(String text, String value) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 35,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _customButton(context, Icons.add),
            const SizedBox(width: 15),
            _customButton(context, Icons.remove),
            const SizedBox(height: 15),
          ],
        ),
      ],
    );
  }

  Widget _calcHeight() {
    return Column(
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' 170.0 ',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'CM',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Slider(
          value: 150,
          onChanged: (val) {},
          min: 90,
          max: 220,
        ),
      ],
    );
  }

  Widget _customButton(BuildContext context, IconData icon) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Icon(icon),
    );
  }
}
