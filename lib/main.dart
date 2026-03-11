import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";
  double calculeazaCorect(List<dynamic> elemente) {
    if (elemente.isEmpty) return 0.0;

    List<dynamic> etapa1 = [elemente[0].toDouble()];

    for (int i = 1; i < elemente.length; i += 2) {
      String op = elemente[i];
      double urmatorul = elemente[i + 1].toDouble();

      if (op == '*' || op == '/' || op == '%') {
        double precedentul = etapa1.removeLast();
        if (op == '*') etapa1.add(precedentul * urmatorul);
        if (op == '/') etapa1.add(precedentul / urmatorul);
        if (op == '%') etapa1.add(precedentul % urmatorul);
      } else {
        etapa1.add(op);
        etapa1.add(urmatorul);
      }
    }

    double rezultat = etapa1[0];
    for (int i = 1; i < etapa1.length; i += 2) {
      String op = etapa1[i];
      double valoare = etapa1[i + 1];

      if (op == '+') rezultat += valoare;
      if (op == '-') rezultat -= valoare;
    }

    return rezultat;
  }

  List<dynamic> _parseExpression(String input) {
    List<dynamic> result = [];
    String buffer = "";

    for (int i = 0; i < input.length; i++) {
      String char = input[i];
      if ("+-*/%".contains(char)) {
        if (buffer.isNotEmpty) {
          result.add(double.parse(buffer));
          buffer = "";
        }
        result.add(char);
      } else {
        buffer += char;
      }
    }
    if (buffer.isNotEmpty) {
      result.add(double.parse(buffer));
    }
    return result;
  }

  Widget _buildFixedButton({
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 80,
      height: 80,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white24,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 150),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                text.isEmpty ? "0" : text,
                style: const TextStyle(fontSize: 60, color: Colors.white),
                maxLines: 1,
              ),
            ),
          ),
          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    if (text.isNotEmpty) {
                      text = text.substring(0, text.length - 1);
                    }
                  });
                },
                child: const Icon(
                  Icons.backspace,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text = "";
                  });
                },
                child: const Text(
                  'C',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "%";
                  });
                },
                child: const Text(
                  '%',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "/";
                  });
                },
                child: const Text(
                  '/',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "7";
                  });
                },
                child: const Text(
                  '7',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "8";
                  });
                },
                child: const Text(
                  '8',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "9";
                  });
                },
                child: const Text(
                  '9',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "X";
                  });
                },
                child: const Text(
                  'X',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "4";
                  });
                },
                child: const Text(
                  '4',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "5";
                  });
                },
                child: const Text(
                  '5',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "6";
                  });
                },
                child: const Text(
                  '6',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "-";
                  });
                },
                child: const Text(
                  '-',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "1";
                  });
                },
                child: const Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "2";
                  });
                },
                child: const Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "3";
                  });
                },
                child: const Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "+";
                  });
                },
                child: const Text(
                  '+',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += ".";
                  });
                },
                child: const Text(
                  '.',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    text += "0";
                  });
                },
                child: const Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              const SizedBox(width: 10),
              _buildFixedButton(
                onPressed: () {
                  setState(() {
                    List<dynamic> elemente = _parseExpression(
                      text.replaceAll('X', '*'),
                    );
                    text = calculeazaCorect(elemente).toString();
                  });
                },
                child: const Text(
                  '=',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
