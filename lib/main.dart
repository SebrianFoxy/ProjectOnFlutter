import 'package:flutter/material.dart';
import 'package:JapanEatProject/ui_kit/_ui_kit.dart';
import 'package:JapanEatProject/ui/screens/food_list_screen.dart';
import 'package:JapanEatProject/ui/screens/cart_screen.dart';
import 'package:JapanEatProject/ui/screens/favorite_screen.dart';
import 'package:JapanEatProject/ui/screens/profile_screen.dart';
import 'package:JapanEatProject/ui/screens/food_detail_screen.dart';
import 'package:JapanEatProject/ui/screens/home_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Japan Eat',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: AppTextStyle.h1Style,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset(AppAsset.profileImage),
            Icon(
              AppIcon.heart,
              color: Theme.of(context).indicatorColor,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
