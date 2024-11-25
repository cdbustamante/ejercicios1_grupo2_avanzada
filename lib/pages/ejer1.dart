import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class NumeroAzar extends StatefulWidget {
  const NumeroAzar({super.key});

  @override
  State<StatefulWidget> createState() => NumeroAzarState();
}

class NumeroAzarState extends State<NumeroAzar> {
  final Random random = Random(); // Generador de números aleatorios
  int numero = 0; // Número generado
  bool continuar = true; // Control para finalizar
  final TextEditingController _controllerA = TextEditingController();
  Timer? _timer; // Timer para la generación periódica

  @override
  void initState() {
    super.initState();
    _startGeneracion();
  }

  void _startGeneracion() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!continuar) {
        timer.cancel(); // Detener el timer si `continuar` es false
      } else {
        generateRandomNumber();
      }
    });
  }

  void _control() {
    if (_controllerA.text.toUpperCase() == 'S') {
      detenerGeneracion();
    } else if (_controllerA.text.toUpperCase() != 'S' && continuar == false) {
      continuar = true;
      _startGeneracion();
    }
  }

  void generateRandomNumber() {
    setState(() {
      numero = random.nextInt(100) * 5; // Generar múltiplo de 5
    });
  }

  void detenerGeneracion() {
    setState(() {
      continuar = false; // Detener la generación
    });
    _timer?.cancel(); // Cancelar el timer si existe
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelar el timer al destruir el widget
    _controllerA.dispose(); // Liberar el controlador de texto
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar Números al Azar'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Diseñar un algoritmo que genere números al azar múltiplos de 5, mientras el usuario no ingresa la opción \'S\' (Salir).',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controllerA,
                decoration: const InputDecoration(
                  labelText: 'Ingrese "S" para detener la generación',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _control,
                child: const Text('Verificar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Número generado: $numero',
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}