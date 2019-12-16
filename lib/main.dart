import 'package:flutter/material.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Joshua Carpentier - Loan Calculator'),
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
  String output = ' ';
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
  Color a = Colors.orange;
  Convert({this.Celcius, this.output});

  String doit(Celcius) {
    if (Celcius >= 30.0 ) cuny='Hot';
    else if (Celcius <= 30.0 && Celcius > 18.0) cuny = 'Warm';
    else if (Celcius <= 18.0 && Celcius > 0) cuny = 'Cold';
    else if (Celcius <= -20.0) cuny = 'Extreme Cold';
    return (273 + (Celcius)).toString() + " " + cuny;
  }

  Color clr(Celcius){
    if (Celcius >= 30.0 ) cuny='Hot';
    else if (Celcius <= 30.0 && Celcius > 18.0) cuny = 'Warm';
    else if (Celcius <= 18.0 && Celcius > 0) cuny = 'Cold';
    else if (Celcius <= -20.0) cuny = 'Extreme Cold';
//    return (273 + (Celcius)).toString() + " " + cuny;
  }

}
