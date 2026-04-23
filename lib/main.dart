import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
enum Genero {Masculino, Feminino}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Genero? _genero = Genero.Masculino;
  final TextEditingController CIdade = TextEditingController();
  final TextEditingController CPeso = TextEditingController();
  final TextEditingController CAltura = TextEditingController();
  double fta = 1.55;
  double resultado = 0;
  // This widget is the root of your application.
  @override
  void dispose() {
    CIdade.dispose();
    CPeso.dispose();
    CAltura.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de Saúde"),
          backgroundColor: const Color.fromARGB(255, 181, 216, 255),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              TextField(
                  controller: CIdade,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                  labelText: "Idade(Anos)",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),

              ),
              SizedBox(height: 16),

              TextField(
                  controller: CPeso,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Peso(KG)",
                    prefixIcon: Icon(Icons.balance),
                    border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: CAltura,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "ALtura(cm)",
                  prefixIcon: Icon(Icons.balance),
                  border: OutlineInputBorder(),
                ),

              ),
              SizedBox(height: 16),

              const Text( 
                "Selecione o Gênero:",
                 style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  RadioListTile<Genero>(
                    title: Text("Masculino"),
                    value: Genero.Masculino,
                    groupValue: _genero,
                    onChanged: (value) {
                      setState(() {
                        _genero = value!;
                      });
                    },
                  ),
                  RadioListTile<Genero>(
                    title: Text("Feminino"),
                    value: Genero.Feminino,
                    groupValue: _genero,
                    onChanged: (value) {
                      setState(() {
                        _genero = value!;
                      });
                    },
                  ),
                ],
              ),
              const Text( 
                "Nível de atividade física:",
                 style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButton<double>(
                value: fta,
                onChanged: (value) {
                  setState(() {
                    fta = value!;
                  });
                },
                items: const [
                  DropdownMenuItem(value: 1.2, child: Text("Sedentário")),
                  DropdownMenuItem(value: 1.375, child: Text("Levemente Ativo")),
                  DropdownMenuItem(value: 1.55, child: Text("Moderado")),
                  DropdownMenuItem(value: 1.725, child: Text("Ativo")),
                  DropdownMenuItem(value: 1.9, child: Text("Muito Ativo")),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  double idade = double.tryParse(CIdade.text) ?? 0;
                  double peso = double.tryParse(CPeso.text) ?? 0;
                  double altura = double.tryParse(CAltura.text) ?? 0;

                  double res;

                  if (_genero == Genero.Masculino) {
                    res = fta * (66 + (13.7 * peso + 5 * altura - 6.8 * idade));
                  } else {
                    res = fta * (655 + (9.6 * peso + 1.8 * altura - 4.7 * idade));
                  }

                  setState(() {
                    resultado = res;
                  });
                },
                child: Text("Calcular"),
              ),
              Text(
                "Resultado: ${resultado.toStringAsFixed(2)} KCal/Dia",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ) 
        ),
      )
    );
  }
}
