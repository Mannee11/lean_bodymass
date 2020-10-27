import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  int selectedRadio, selectedRadio2;
  double height, weight;
  String boer, james, hume, peters;
  String brBF, jBF, hBF, pBF;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              title: new Center(
                  child: Text('Lean Body Mass-Metric Unit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))),
              backgroundColor: Colors.red,
            ),
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Gender',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        activeColor: Colors.redAccent,
                        onChanged: ((int value) {
                          onChanged(value);
                        }),
                      ),
                      Container(
                        child: Text('Male'),
                      ),
                      Radio(
                        value: 2,
                        groupValue: selectedRadio,
                        activeColor: Colors.redAccent,
                        onChanged: ((int value) {
                          onChanged(value);
                        }),
                      ),
                      Container(
                        child: Text('Female'),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Are you 14 or younger ?',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Radio(
                      value: 1,
                      groupValue: selectedRadio2,
                      activeColor: Colors.redAccent,
                      onChanged: ((int value) {
                        onChanged2(value);
                      }),
                    ),
                    Container(
                      child: Text('Yes'),
                    ),
                    Radio(
                        value: 2,
                        groupValue: selectedRadio2,
                        activeColor: Colors.redAccent,
                        onChanged: (int value) {
                          onChanged2((value));
                        }),
                    Container(
                      child: Text('No'),
                    ),
                  ],
                ),
              ]),
              Container(
                child: Text(
                  'Height',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "(cm)",
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: _height,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Weight',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                alignment: Alignment.center,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "(kg)",
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: _weight,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: _calculate,
                        icon: Icon(Icons.play_arrow_outlined),
                        label: Text('Calculate'),
                        color: Colors.amber,
                        splashColor: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("Clear"),
                        color: Colors.amber,
                        onPressed: _clear,
                      ),
                    ),
                  ]),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text(
                  "Results:",
                  style:
                      TextStyle(fontSize: 15, color: Colors.deepPurpleAccent),
                ),
                alignment: Alignment.center,
              ),
              Container(
                child: Text(
                  'The lean body meass based on different formulas:',
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
                alignment: Alignment.center,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20.0),
                child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        Text('Formula', textAlign: TextAlign.center),
                        Text('Lean Body Mass(kg)', textAlign: TextAlign.center),
                        Text('Body Fat(%)', textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text('Boer', textAlign: TextAlign.center),
                        Text('$boer', textAlign: TextAlign.center),
                        Text('$brBF', textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text('James', textAlign: TextAlign.center),
                        Text('$james', textAlign: TextAlign.center),
                        Text('$jBF', textAlign: TextAlign.center),
                      ]),
                      TableRow(children: [
                        Text('Hume', textAlign: TextAlign.center),
                        Text('$hume', textAlign: TextAlign.center),
                        Text('$hBF', textAlign: TextAlign.center),
                      ]),
                      TableRow(
                          decoration: BoxDecoration(color: Colors.grey),
                          children: [
                            Text(''),
                            Text(''),
                            Text(''),
                          ]),
                      TableRow(children: [
                        Text('Peters(for Children)',
                            textAlign: TextAlign.center),
                        Text('$peters', textAlign: TextAlign.center),
                        Text('$pBF', textAlign: TextAlign.center),
                      ]),
                    ]),
              ),
            ]))));
  }

  void _calculate() {
    setState(() {});
    height = double.parse(_height.text);
    weight = double.parse(_weight.text);

    if (selectedRadio == 1 && selectedRadio2 == 1) {
      double boer_1 = (0.407 * weight) + (0.267 * height) - 19.2;
      double james_1 = (1.1 * weight) - (128 * (pow(weight / height, 2)));
      double hume_1 = (0.32810 * weight) + (0.33929 * height) - 29.5336;
      double peter_1 =
          3.8 * (0.0215 * (pow(weight, 0.6469)) * (pow(height, 0.7236)));

      double b1Bodyfat = 100 - (boer_1 / weight) * 100;
      double j1Bodyfat = 100 - (james_1 / weight) * 100;
      double h1Bodyfat = 100 - (hume_1 / weight) * 100;
      double p1Bodyfat = 100 - (peter_1 / weight) * 100;

      boer = boer_1.toStringAsFixed(1);
      james = james_1.toStringAsFixed(1);
      hume = hume_1.toStringAsFixed(1);
      peters = peter_1.toStringAsFixed(1);

      brBF = b1Bodyfat.toStringAsFixed(0);
      jBF = j1Bodyfat.toStringAsFixed(0);
      hBF = h1Bodyfat.toStringAsFixed(0);
      pBF = p1Bodyfat.toStringAsFixed(0);
    } else if (selectedRadio == 1 && selectedRadio2 == 2) {
      double boer_1 = (0.407 * weight) + (0.267 * height) - 19.2;
      double james_1 = (1.1 * weight) - (128 * (pow(weight / height, 2)));
      double hume_1 = (0.32810 * weight) + (0.33929 * height) - 29.5336;

      double b1Bodyfat = 100 - (boer_1 / weight) * 100;
      double j1Bodyfat = 100 - (james_1 / weight) * 100;
      double h1Bodyfat = 100 - (hume_1 / weight) * 100;

      boer = boer_1.toStringAsFixed(1);
      james = james_1.toStringAsFixed(1);
      hume = hume_1.toStringAsFixed(1);
      peters = '*';

      brBF = b1Bodyfat.toStringAsFixed(0);
      jBF = j1Bodyfat.toStringAsFixed(0);
      hBF = h1Bodyfat.toStringAsFixed(0);
      pBF = '*';
    }
    if (selectedRadio == 2 && selectedRadio2 == 1) {
      double boer_1 = (0.252 * weight) + (0.473 * height) - 48.3;
      double james_1 = (1.07 * weight) - (148 * (pow(weight / height, 2)));
      double hume_1 = (0.29569 * weight) + (0.41813 * height) - 43.2933;
      double peter_1 =
          3.8 * (0.0215 * (pow(weight, 0.6469)) * (pow(height, 0.7236)));

      double b1Bodyfat = 100 - (boer_1 / weight) * 100;
      double j1Bodyfat = 100 - (james_1 / weight) * 100;
      double h1Bodyfat = 100 - (hume_1 / weight) * 100;
      double p1Bodyfat = 100 - (peter_1 / weight) * 100;

      boer = boer_1.toStringAsFixed(1);
      james = james_1.toStringAsFixed(1);
      hume = hume_1.toStringAsFixed(1);
      peters = peter_1.toStringAsFixed(1);

      brBF = b1Bodyfat.toStringAsFixed(0);
      jBF = j1Bodyfat.toStringAsFixed(0);
      hBF = h1Bodyfat.toStringAsFixed(0);
      pBF = p1Bodyfat.toStringAsFixed(0);
    } else if (selectedRadio == 2 && selectedRadio2 == 2) {
      double boer_1 = (0.252 * weight) + (0.473 * height) - 48.3;
      double james_1 = (1.07 * weight) - (148 * (pow(weight / height, 2)));
      double hume_1 = (0.29569 * weight) + (0.41813 * height) - 43.2933;

      double b1Bodyfat = 100 - (boer_1 / weight) * 100;
      double j1Bodyfat = 100 - (james_1 / weight) * 100;
      double h1Bodyfat = 100 - (hume_1 / weight) * 100;

      boer = boer_1.toStringAsFixed(1);
      james = james_1.toStringAsFixed(1);
      hume = hume_1.toStringAsFixed(1);
      peters = '*';

      brBF = b1Bodyfat.toStringAsFixed(0);
      jBF = j1Bodyfat.toStringAsFixed(0);
      hBF = h1Bodyfat.toStringAsFixed(0);
      pBF = '*';
    }
  }

  void onChanged(int value) {
    setState(() {
      selectedRadio = value;
    });
  }

  void onChanged2(int value) {
    setState(() {
      selectedRadio2 = value;
    });
  }

  void _clear() {
    setState(() {
      _height.clear();
      _weight.clear();
      selectedRadio = 0;
      selectedRadio2 = 0;
      peters = "—";
      pBF = "—";
      boer = "—";
      brBF = "—";
      james = "—";
      jBF = "—";
      hume = "—";
      hBF = "—";
    });
  }
}
