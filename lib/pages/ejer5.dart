import 'package:flutter/material.dart';

class PromedioTemperatura extends StatefulWidget {
  const PromedioTemperatura({super.key});

  @override
  State<StatefulWidget> createState() => PromedioTemperaturaState();
}

class PromedioTemperaturaState extends State<PromedioTemperatura> {
  final TextEditingController _temperaturaController1 = TextEditingController();
  final TextEditingController _temperaturaController2 = TextEditingController();

  double? promedioTemperatura = 0;
  String resultado = '';

  void promTemp() {
    try {
      double temp1 = double.parse(_temperaturaController1.text);
      double temp2 = double.parse(_temperaturaController2.text);

      if (temp1 < 0 || temp2 < 0) {
        resultado = 'Las temperaturas no pueden ser negativas';
      } else if (temp1 == 0) {
        resultado = 'La temperatura 1 ha llegado a 0';
      } else if (temp1 >= 5 && temp1 <= 15 && temp2 >= 5 && temp2 <= 15) {
        promedioTemperatura = (temp1 + temp2) / 2;
        resultado = 'El promedio de las temperaturas es: $promedioTemperatura';
      } else {
        resultado = 'Las temperaturas no cumplen con los requisitos';
      }
    } catch (e) {
      resultado = 'Por favor, ingrese valores válidos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promedio de Temperaturas'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Se leen desde teclado pares de temperaturas (T1 y T2) hasta que T1 sea cero. Hallar el promedio de las temperaturas ingresadas que están comprendidas entre 5° y 15° (incluidos).',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _temperaturaController1,
                decoration: const InputDecoration(
                  labelText: 'Ingrese la temperatura 1',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _temperaturaController2,
                decoration: const InputDecoration(
                  labelText: 'Ingrese la temperatura 2',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    promTemp();
                  });
                },
                child: const Text('Calcular'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(200, 50),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                resultado,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
