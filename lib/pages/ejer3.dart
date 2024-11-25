import 'package:flutter/material.dart';

class Promedio extends StatefulWidget {
  const Promedio({super.key});

  @override
  State<Promedio> createState() => _PromedioState();
}

class _PromedioState extends State<Promedio> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _sexoController = TextEditingController();

  List<double> alturasMujeres = [];
  List<double> alturasVarones = [];
  List<int> edades = [];

  double promedioAlturaMujeres = 0;
  double promedioAlturaVarones = 0;
  double promedioEdad = 0;

  bool ingresoFinalizado = false;

  void _calcularPromedios() {
    setState(() {
      if (alturasMujeres.isNotEmpty) {
        promedioAlturaMujeres =
            alturasMujeres.reduce((a, b) => a + b) / alturasMujeres.length;
      }
      if (alturasVarones.isNotEmpty) {
        promedioAlturaVarones =
            alturasVarones.reduce((a, b) => a + b) / alturasVarones.length;
      }
      if (edades.isNotEmpty) {
        promedioEdad = edades.reduce((a, b) => a + b) / edades.length;
      }
    });
  }

  void _agregarParticipante() {
    try {
      double altura = double.parse(_alturaController.text);
      int edad = int.parse(_edadController.text);
      String sexo = _sexoController.text.toUpperCase();

      if (altura < 0) {
        _calcularPromedios();
        setState(() {
          ingresoFinalizado = true;
        });
        return;
      }

      if (sexo != 'F' && sexo != 'M') {
        throw FormatException("Sexo debe ser F o M");
      }

      setState(() {
        if (sexo == 'F') {
          alturasMujeres.add(altura);
        } else if (sexo == 'M') {
          alturasVarones.add(altura);
        }
        edades.add(edad);
      });

      _alturaController.clear();
      _edadController.clear();
      _sexoController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Entrada inválida: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promedio de Participantes'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Diseñar un algoritmo que lea desde teclado la información sobre altura, edad, y sexo (F/M) de los participantes de un curso. La lectura finaliza cuando se lee un valor de altura negativo. Luego calcule:\n'
                    'a. Promedio de altura de las mujeres.\n'
                    'b. Promedio de altura de los varones.\n'
                    'c. Promedio de edad de los participantes.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              if (!ingresoFinalizado) ...[
                TextField(
                  controller: _alturaController,
                  decoration: const InputDecoration(
                    labelText: 'Altura',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _edadController,
                  decoration: const InputDecoration(
                    labelText: 'Edad',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _sexoController,
                  decoration: const InputDecoration(
                    labelText: 'Sexo (F/M)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _agregarParticipante,
                  child: const Text('Agregar Participante'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(200, 50),
                  ),
                ),
              ] else ...[
                const Text(
                  'Ingreso de participantes finalizado.',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Promedio de altura de las mujeres: $promedioAlturaMujeres',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Promedio de altura de los varones: $promedioAlturaVarones',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Promedio de edad de los participantes: $promedioEdad',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}