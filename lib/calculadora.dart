import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

double num1 = 0;
double num2 = 0;
String resultado = '0';
String operacao = '';

class _CalculadoraState extends State<Calculadora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Calculadora',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                color: Colors.black,
                child: Text(
                  resultado,
                  style: const TextStyle(color: Colors.white, fontSize: 45),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        onPressed(
                          buttons[index],
                        );
                      },
                      child: Text(
                        buttons[index],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onPressed(String text) {
    setState(() {
      if (text == 'C') {
        resultado = '0';
        num1 = 0;
        num2 = 0;
        operacao = '';
      } else if (text == '+' || text == '-' || text == '/' || text == '*') {
        num1 = double.parse(resultado);
        operacao = text;
        resultado = '0';
      } else if (text == '=') {
        num2 = double.parse(resultado);

        if (operacao == '+') {
          resultado = (num1 + num2).toString();
        } else if (operacao == '-') {
          resultado = (num1 - num2).toString();
        } else if (operacao == '/') {
          resultado = (num2 != 0) ? (num1 / num2).toString() : 'Erro';
        } else if (operacao == '*') {
          resultado = (num1 * num2).toString();
        }

        num1 = 0;
        num2 = 0;
        operacao = '';
      } else {
        if (resultado == '0') {
          resultado = text;
        } else {
          resultado += text;
        }
      }
    });
  }

  List<String> buttons = [
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '/',
    'C',
    '0',
    '=',
    '+'
  ];
}
