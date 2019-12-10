import 'package:flutter/material.dart';

//Design a flutter app that takes an input from the user in Celsius unit and
// displays Kelvin equivalent of the Celsius number entered. You can use
// K= (C+273) formula to convert from Celsius to Kelvin.
//
//Also, If it is higher than 30 degrees Celsius, then it should say "Hot",
// if it is higher than 18 degrees Celsius, then it should say "Warm", if it is
// higher than 0 degrees Celsius, then it should says "Cold", it it is less than
// 0, then it should say "Very Cold", if it is less than -20, then it should say
// "Extreme Cold".

//Submit your code and your screen prints with your names written on them.


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Joshua Carpentier - Degree Calculator Convertor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String output = 'its raining';
  double input = 0 ;
  int K =0,  C = 0,n1 = 0, n2 = 0;
  String t1, t2;
  Convert calc = Convert(Celcius: 33, output: "test");//

  void _incrementCounter() {
    setState(() {
      output = calc.doit(input);
      _counter++;

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(output,
            style: TextStyle(fontFamily: 'Courier',
            backgroundColor: Colors.black,
            color: Colors.blueAccent,
            fontSize: 30,
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter Temp in Celcius',
                  border: OutlineInputBorder(),
//                  hintText: 'Please go ahead and type something in'
              ),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                input = double.parse(text);
              },
            ),
            Text(output),
            FlatButton(onPressed: _incrementCounter, child: Text("Convert"),
              color: Colors.deepOrange,textColor: Colors.yellow,),

          ],
        ),
      ),

    );
  }
}

class Convert{
  double Celcius;
  String result, output, cuny = '' ;

  Convert({this.Celcius, this.output});

  String doit(Celcius) {
    if (Celcius >= 30.0 ) cuny='Hot';
    else if (Celcius <= 30.0 && Celcius > 18.0) cuny = 'Warm';
    else if (Celcius <= 18.0 && Celcius > 0) cuny = 'Cold';
    else if (Celcius <= -20.0) cuny = 'Extreme Cold';




    return (273 + (Celcius)).toString() + " " + cuny;
  }



}
