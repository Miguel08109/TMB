import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                decoration: InputDecoration(
                  labelText: "Idade(Anos)",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: "Peso(KG)",
                  prefixIcon: Icon(Icons.balance),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
            TextField(
                decoration: InputDecoration(
                  labelText: "ALtura(cm)",
                  prefixIcon: Icon(Icons.balance),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
            ],
          ),
        )
        
      )
    );
  }
}
