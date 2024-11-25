import 'package:flutter/material.dart';

class Suma extends StatefulWidget {
  const Suma({super.key});

  @override
  State<StatefulWidget> createState() => SumaState();
}

class SumaState extends State<Suma> {
  final TextEditingController _controllerA = TextEditingController();

  int _multiplosDeSeis = 0;
  int _sumaEntreUnoYDiez = 0;
  int _sumaTotal = 0;

  String _mensaje = '';

  void _procesar() {
    if (_sumaTotal >= 1000) {
      // Si ya se llegó al límite, no procesar más números
      _mensaje =
      'La suma total ya llegó o superó 1000.\nResultados:\n- Múltiplos de 6: $_multiplosDeSeis\n- Suma entre 1 y 10: $_sumaEntreUnoYDiez';
      return;
    }

    // Convertir el número ingresado
    final String input = _controllerA.text;
    if (input.isEmpty) {
      _mensaje = 'Por favor, ingrese un número válido.';
      return;
    }

    final int numero = int.parse(input);

    // Actualizar los cálculos
    if (numero >= 1 && numero <= 10) {
      _sumaEntreUnoYDiez += numero;
    } else if (numero % 6 == 0) {
      _multiplosDeSeis++;
    }
    _sumaTotal += numero;

    // Verificar si la suma total llegó a 1000
    if (_sumaTotal >= 1000) {
      _mensaje =
      'La suma total ya llegó o superó 1000.\nResultados:\n- Múltiplos de 6: $_multiplosDeSeis\n- Suma entre 1 y 10: $_sumaEntreUnoYDiez';
    }

    _controllerA.clear(); // Limpiar el campo de texto después de procesar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suma de Números'),
        backgroundColor: Colors.blue,
      ), // AppBar

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Se leen desde teclado números hasta que la suma de los mismos llegue a 1000. Mientras tanto debe hallar:\n'
                    'a. La cantidad de números múltiplos de 6.\n'
                    'b. La suma de los números que se encuentran entre el 1 y el 10 (incluidos).',
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
                    _procesar();
                  });
                },
                child: const Text('Procesar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                _mensaje,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}