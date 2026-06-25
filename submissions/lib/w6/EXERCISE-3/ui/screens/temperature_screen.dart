import 'package:flutter/material.dart';
import 'package:submissions/w6/EXERCISE-3/ui/screens/bye.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  double temp = 0;

  void calculate(String input) {
    setState(() {
      temp = (double.parse(input) * 1.8) + 32;
    });
  }

  void changeScreen() {
    Navigator.pop(context);
  }

  void changeScreenBye() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ByeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff16C062), Color(0xff00BCDC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.thermostat_outlined,
                  size: 120,
                  color: Colors.white,
                ),
                const Center(
                  child: Text(
                    "Converter",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                ),
                const SizedBox(height: 50),
                const Text("Temperature in Degrees:"),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (temp) => calculate(temp),
                  decoration: inputDecoration,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),
                const Text("Temperature in Fahrenheit:"),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("${temp.toStringAsFixed(2)}°F"),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: changeScreen,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1.0, color: Colors.white),
                      ),
                      child: const Text(
                        'go back',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: changeScreenBye,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1.0, color: Colors.white),
                      ),
                      child: const Text(
                        'go to bye',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
