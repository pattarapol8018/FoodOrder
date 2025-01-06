import 'dart:math';
import 'package:flutter/material.dart';
import 'Food.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _primeNumbers = [];
  
 
  bool _isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  int _generateRandomPrime() {
    Random random = Random();
    while (true) {
      int number = random.nextInt(100) + 1; 
      if (_isPrime(number)) {
        return number;
      }
    }
  }

  // ฟังก์ชันสุ่มตัวเลขเฉพาะและเพิ่มเข้าไปใน list ทีละตัว
  void _generateNextPrime() {
    if (_primeNumbers.length < 10) {
      setState(() {
        _primeNumbers.add(_generateRandomPrime());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _primeNumbers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index Phone number is ${_primeNumbers[index]}'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateNextPrime, // เพิ่มจำนวนเฉพาะทีละตัว
        tooltip: 'Generate Next Prime',
        child: const Icon(Icons.add),
      ),
    );
  }
}
