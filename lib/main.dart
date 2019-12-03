import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Joshua Carpentier - Tip Calculator'),
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
  String t1, t2, result1 = '';
  double n2;
  TipCalculate fish = TipCalculate(service: 'g', bill: 100);
  void _incrementCounter() {
    setState(() {
      _counter++;
      print('t1 =' + t1 + '. t2 = ' + t2);
      result1 = fish.tip(n2, t1);
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
            Text(result1, style: TextStyle(fontSize: 22.9) ,),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Enter Service',
                  border: OutlineInputBorder(),
                  hintText: 'good(g), alright(a), not bad(n), poor(p)'
              ),
              onChanged:  (text){
                t1 = text;
                //n2 = double.parse(t2);
              },
            ),
            SizedBox(height: 40,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Enter the bill please',
                  border: OutlineInputBorder(),
                  hintText: 'How much was the bill?'
              ),
              onChanged:  (text){
                t2 = text;
                n2 = double.parse(t2);
              },
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Find Tip',
        child: Icon(Icons.timer),
      ),
    );
  }
}

class TipCalculate{
  double bill, tiprate;
  String service, result="";
  TipCalculate({this.bill, this.service});
  String tip(bill, service){
    if(service == 'g' || service == 'good')
      tiprate = 0.25;
    else if(service == 'a' || service == 'alright')
      tiprate = 0.15;
    else if(service == 'n' || service == 'not bad')
      tiprate = 0.10;
    else if(service == 'p' || service == 'poor')
      tiprate = 0;

    result = 'Tip is \$' + (bill * tiprate).toString() + '.';
    return result;
  }

}
