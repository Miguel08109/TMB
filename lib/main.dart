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
  // This widget is the root of your application.
  @override
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
              RadioGroup<Genero>(
                groupValue: _genero,

                onChanged: (Genero? value) {
                  setState(() {
                    _genero = value;
                    print("Escolha: ${_genero}");
                  });
                },
                child: Column(
                  children: [
                    RadioListTile<Genero>(
                      title: Text("Masculino"),
                      value: Genero.Masculino,
                    ),
                    RadioListTile<Genero>(
                      title: Text("Feminino"),
                      value: Genero.Feminino,
                    )
                  ],
                ),
              ),
              const Text(
                "Nível de Atividade Física:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownMenu(
                initialSelection: 'Moderadamente Ativo',
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 1.2, label: "Sedentário"),
                  DropdownMenuEntry(value: 1.375, label: "Levemente Ativo"),
                  DropdownMenuEntry(value: 1.55, label: "Moderadamente Ativo"),
                  DropdownMenuEntry(value: 1.725, label: "Altamente Ativo"),
                  DropdownMenuEntry(value: 1.9, label: "Extremamente Ativo"),
                ],
              )
            ],
          ) 
        ),
      )
    );
  }
}
