import 'package:flutter/material.dart';

// Home screen
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloco de Notas',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 215, 146),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text(
            'Bloco de Notas',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        body: const Center(
          child: Text('Home screen'),
        ),
      ),
    );
  }
}
