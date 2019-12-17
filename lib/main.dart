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
  String output = ' ';
  double weekly =0, amount = 0 ;
  Calculate calc = Calculate(amount: 33, weekly: 32);//

  void _incrementCounter() {
    setState(() {
      output = calc.doit(amount, weekly);

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
            color: Colors.green,
            fontSize: 20,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Loan Amount',
                  fillColor: Colors.lightGreen,
//                  hintText: 'Please go ahead and type something in'
              ),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                amount = double.parse(text);
              },
            ), SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Weekly Payment Amount',
                fillColor: Colors.lightGreen,
//                  hintText: 'Please go ahead and type something in'
              ),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                weekly = double.parse(text);
              },
            ),
            Container(
              child: FlatButton(onPressed: _incrementCounter,
                child: Text("Calculate Loan")),
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(3.0),
             decoration: BoxDecoration(border: Border.all(
               color: Colors.deepOrange)),),


          ],
        ),
      ),

    );
  }
}

class Calculate{
  double amount;
  double weekly;
  String output = '' ;
  int count;
  String cuny = '';
  Color a = Colors.orange;
  Calculate({this.amount, this.weekly});

  String doit(amount, weekly) {
    output = '';
    count = 0;
    output = output + '\n Weeks: ' + count.toString() + ' .Amount \$' + amount.toString();


    while(amount > 0){

      amount = amount - weekly;
      count = count + 1;
      output = output + '\n Weeks: ' + count.toString() + ' .Amount \$' + amount.toString();

      if (amount<weekly) {
        count = count + 1;
        amount = 0;

        output = output + '\n Weeks: ' + count.toString() + ' .Amount \$' +
            amount.toString();
        amount = 0;

      }count++;
    }

    return output;
  }

}
