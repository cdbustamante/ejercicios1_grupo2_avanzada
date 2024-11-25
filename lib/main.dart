import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'pages/ejer1.dart';
import 'pages/ejer2.dart';
import 'pages/ejer3.dart';
import 'pages/ejer4.dart';
import 'pages/ejer5.dart';
import 'pages/ejer6.dart';

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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
      routes: {
        '/ejer1': (context) => const NumeroAzar(),
        '/ejer2': (context) => const Primo(),
        '/ejer3': (context) => const Promedio(),
        '/ejer4': (context) => const Ruleta(),
        '/ejer5': (context) => const PromedioTemperatura(),
        '/ejer6': (context) => const Suma(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Ejercicios'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildMenuButton(context, 'Ejercicio 1', Icons.looks_one, '/ejer1'),
            _buildMenuButton(context, 'Ejercicio 2', Icons.looks_two, '/ejer2'),
            _buildMenuButton(context, 'Ejercicio 3', Icons.looks_3, '/ejer3'),
            _buildMenuButton(context, 'Ejercicio 4', Icons.looks_4, '/ejer4'),
            _buildMenuButton(context, 'Ejercicio 5', Icons.looks_5, '/ejer5'),
            _buildMenuButton(context, 'Ejercicio 6', Icons.looks_6, '/ejer6'),
            const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Salir'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String text, IconData icon, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          minimumSize: const Size(200, 50),
        ),
      ),
    );
  }
}