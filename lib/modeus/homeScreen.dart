import 'package:flutter/material.dart';

class HomeSreen extends StatefulWidget {
  @override
  _HomeSreenState createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _textInfo = 'Informe seus dados';

  void _resetField() {
    weightController.text = '';
    heightController.text = '';

    setState(() {
      _textInfo = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está baixo do Peso";
      } else if (imc > 18.6 && imc < 24.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está no seu Peso Ideal";
      } else if (imc > 24.9 && imc < 29.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está Levemente acima do Peso";
      } else if (imc > 29.9 && imc < 34.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está com Obesidade grau 1";
      } else if (imc > 34.9 && imc < 39.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está com Obesidade grau 2";
      } else if (imc > 39.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está com Obesidade grau 3";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULADORA DE IMC"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/man.png",
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
            ),
            Form(
              child: Column(
                key: _formKey,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                    controller: weightController,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                    controller: heightController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            ElevatedButton(
              onPressed: () {
                _calculate();
              },
              child: Text("Calcular"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            Text(
              _textInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.purple,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
