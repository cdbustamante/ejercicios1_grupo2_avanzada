import 'package:flutter/material.dart';

class Primo extends StatefulWidget {
  const Primo({super.key});

  @override
  State<StatefulWidget> createState() => PrimoState();
}

class PrimoState extends State<Primo> {
  final TextEditingController _controllerA = TextEditingController();
  String _resultado = '';
  bool primo = true;

  void verificarPrimo(int num) {
    primo = true;
    if (num < 2) {
      primo = false;
    }
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) {
        primo = false;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar si un número es primo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Diseñar un algoritmo que lea un número desde teclado y determine si el mismo es primo o no.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controllerA,
                decoration: const InputDecoration(
                  labelText: 'Ingrese un número',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    try {
                      int num = int.parse(_controllerA.text);
                      verificarPrimo(num);
                      if (primo) {
                        _resultado = 'El número $num es primo';
                      } else {
                        _resultado = 'El número $num no es primo';
                      }
                    } catch (e) {
                      _resultado = 'Por favor, ingrese un número válido';
                    }
                  });
                },
                child: const Text('Verificar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                _resultado,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}