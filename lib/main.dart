import 'dart:math';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo: Random Food Menu'),
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
  final List<Map<String, dynamic>> _menuOptions = [
    {
      'name': 'Salad',
      'price': 80,
      'ingredients': ['Lettuce', 'Tomato', 'Cheese']
    },
    {
      'name': 'Steak',
      'price': 200,
      'ingredients': ['Beef', 'Cheese', 'Potato']
    },
    {
      'name': 'Pasta',
      'price': 100,
      'ingredients': ['Pasta', 'Cheese', 'Beef']
    },
    {
      'name': 'Burger',
      'price': 150,
      'ingredients': ['Beef', 'Lettuce', 'Tomato', 'Cheese']
    },
  ];

  List<Map<String, dynamic>> _selectedMenus = [];

  int get _totalPrice => _selectedMenus.fold(0, (sum, menu) => sum + menu['price'] as int);

  void _generateRandomMenu() {
    setState(() {
      Random random = Random();
      final randomMenu = _menuOptions[random.nextInt(_menuOptions.length)];
      _selectedMenus.add(randomMenu);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('${widget.title} - Total Price: $_totalPrice'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _selectedMenus.length,
          itemBuilder: (context, index) {
            final menu = _selectedMenus[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple[100],
                child: Text(
                  '${menu['price']}',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              title: Text('Dish $index is ${menu['name']}'),
              subtitle: Text(
                'This menu ingredients are ${menu['ingredients'].join(', ')}',
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomMenu, // สุ่มเมนูอาหารใหม่
        tooltip: 'Add Random Menu',
        child: const Icon(Icons.add),
      ),
    );
  }
}
