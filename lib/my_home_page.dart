import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTurnedOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isTurnedOn ? Colors.black : Colors.white,
      ),
      backgroundColor: isTurnedOn ? Colors.black : Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  isTurnedOn = !isTurnedOn;
                });
                Flashlight();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isTurnedOn ? Colors.white : Colors.black,
                    width: 2,
                  ),
                  color: isTurnedOn ? Colors.black : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.power_settings_new,
                  size: 120,
                  color: isTurnedOn ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void Flashlight() {
    
  }
}
