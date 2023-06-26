import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: TempApp(),
      debugShowCheckedModeBanner: false
      ,
    );
  }
}

class TempApp extends StatefulWidget {
  @override
  TempState createState() => TempState();
}

class TempState extends State<TempApp> {
  late double input;
  late double output;
 late  bool fOrC;

  @override
  void initState() {
    super.initState();
    input = 0.0;
    output = 0.0;
    fOrC = true;
  }

  @override
  Widget build(BuildContext context) {
    TextField inputField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (str) {
        try {
          input = double.parse(str);
        } catch (e) {
          input = 0.0;
        }
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        labelText:
        "Input a Value in ${fOrC == false ? "Fahrenheit" : "Celsius"}",
      ),

      textAlign: TextAlign.justify,
    );

    AppBar appBar = AppBar(
      title: Text("Temperature Convertor"),
      centerTitle: true,
    );

    Container tempSwitch = Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          //Text("Choose Fahrenheit or Celsius"),
          //Switch(
          //  value: fOrC,
          //  onChanged: (e) {
          //    setState(() {
          //      fOrC = !fOrC;
          //    });
          //  },
          //)

          //Checkbox(
          //  value: fOrC,
          //  onChanged: (e) {
          //    setState(() {
          //      fOrC = !fOrC;
          //    });
          //  },
          //),

          Text("F"),
          Radio<bool>(
              groupValue: fOrC,
              value: false,
              onChanged: (v) {
                setState(() {
                  fOrC = v!;
                });
              }),
          Text("C"),
          Radio<bool>(
              groupValue: fOrC,
              value: true,
              onChanged: (v) {
                setState(() {
                  fOrC = v!;
                });
              }),
        ],
      ),
    );

    Container calcBtn = Container(
      child: ElevatedButton(
        child: Text("Calculate"),
        onPressed: () {
          setState(() {
            fOrC == false
                ? output = (input - 32) * (5 / 9)
                : output = (input * 9 / 5) + 32;
          });
          AlertDialog dialog = AlertDialog(
            content: fOrC == false
                ? Text(
                "${input.toStringAsFixed(2)} F : ${output.toStringAsFixed(2)} C")
                : Text(
                "${input.toStringAsFixed(2)} C : ${output.toStringAsFixed(2)} F"),
          );
          showDialog(builder: (context) => dialog, context: context);
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            inputField,
            tempSwitch,
            calcBtn,
          ],
        ),
      ),
    );
  }
}