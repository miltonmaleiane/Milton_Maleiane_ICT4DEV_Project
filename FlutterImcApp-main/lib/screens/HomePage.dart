import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _resultado = '';
TextEditingController _controllerweight = TextEditingController();
TextEditingController _controllerheight = TextEditingController();

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String value = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
              child: Text(
                'Insert info',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            criarEditText('Body weight (Kg)', _controllerweight),
            criarEditText('Height (cm)', _controllerheight),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
              child: Text(
                _resultado,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: 50.0,
                width: 250.0,
                color: Color.fromARGB(255, 250, 81, 14),
                child: ElevatedButton(
                  onPressed: () {
                    double? weight = double.tryParse(
                        _controllerweight.text); // variable to introduce weight
                    double? height = double.tryParse(
                        _controllerheight.text); // variable to introduce height

                    if (weight != null && height != null) {
                      height = height / 100.0;
                      double _imc = (weight / (height * height))
                          .roundToDouble(); // Body Mass Index formula
                      setState(() {
                        value = 'Your BMI is: $_imc';
                      });
                    } else {
                      setState(() {
                        value = '';
                      });
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => secondScreen(value: value)));
                  },
                  child: Text('Calculate BMI'),
                ))
          ],
        ),
      ),
    );
  }

  Padding criarEditText(String texto, TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: texto,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              fontSize: 25.0,
              color: Color.fromARGB(255, 253, 98, 2),
            )),
      ),
    );
  }
}

class secondScreen extends StatelessWidget {
  final String value;
  const secondScreen({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Result Screen '),
          backgroundColor: Color.fromARGB(255, 3, 1, 17),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            value,
            style: TextStyle(fontSize: 36),
          ),
        ),
      );
}
