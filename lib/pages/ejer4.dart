import 'package:flutter/material.dart';

class Ruleta extends StatefulWidget {
  const Ruleta({super.key});

  @override
  State<StatefulWidget> createState() => RuletaState();
}

class RuletaState extends State<Ruleta> {
  List<TextEditingController> controllers = [];
  String resultado1 = "";
  String resultado2 = "";
  String resultado3 = "";
  String resultado4 = "";

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      controllers.add(TextEditingController());
    }
  }

  void calcularResul() {
    int impares = 0;
    int pares = 0;
    int descenas = 0;
    int maxNumero = -1;
    int sumaPares = 0;
    int cantidadPares = 0;

    List<int> numeros = [];
    for (int i = 0; i < 10; i++) {
      try {
        int numero = int.parse(controllers[i].text);
        if (numero < 0 || numero > 36) {
          throw FormatException("Número fuera de rango (0-36)");
        }
        numeros.add(numero);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Entrada inválida en el número ${i + 1}: $e'),
        ));
        return;
      }
    }

    for (int numero in numeros) {
      if (numero % 2 == 0) {
        pares++;
        if (numero != 0) {
          sumaPares += numero;
          cantidadPares++;
        }
      } else {
        impares++;
      }
      if (numero >= 13 && numero <= 24) {
        descenas++;
      }
      if (numero > maxNumero) {
        maxNumero = numero;
      }
    }

    setState(() {
      resultado1 = 'Cantidad de números impares: $impares';
      resultado2 = 'Promedio de los números pares (sin contar ceros): ${cantidadPares > 0 ? (sumaPares / cantidadPares).toStringAsFixed(2) : 0}';
      resultado3 = 'Cantidad de números en la 2ª docena (13-24): $descenas';
      resultado4 = 'El número más grande: $maxNumero';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ruleta'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Se ingresan 10 números cuyos valores corresponden a los de la ruleta (0,1,2,...,36), se pide hallar y mostrar por pantalla lo siguiente:\n'
                    'a. Cantidad de números impares.\n'
                    'b. Promedio de los números pares (no contar los ceros).\n'
                    'c. Cantidad de números que se encuentran en la 2ª docena (13 al 24).\n'
                    'd. El número más grande.\n'
                    'e. ¿En qué cambia la solución si en lugar de leer 10 números, ahora se leen números hasta que llega el valor 36?',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < 10; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextField(
                    controller: controllers[i],
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Número ${i + 1}',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: calcularResul,
                child: const Text('Calcular'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                resultado1,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                resultado2,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                resultado3,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                resultado4,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
