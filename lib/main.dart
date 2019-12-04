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
      home: MyHomePage(title: 'Joshua Carpentier - Grade Calculator'),
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
  void _incrementCounter() {
    setState(() {
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
            Row(
              children: <Widget>[
                Container(
                  child: Text('Result Goes here',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'courier',
                        backgroundColor: Colors.blue,
                        color: Colors.yellow,
                    ),


                  ),
                ),
              ],
            ),
          SizedBox(height: 10.0,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your Name Please'),
            keyboardType: TextInputType.text,
            onChanged: (text){
              t1 = text;
            },
          ),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Grade Please'),
              keyboardType: TextInputType.text,
              onChanged: (text){
                t2 = text;
              },
            ),

          FlatButton(onPressed: _incrementCounter,
              child: Container(margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                
                child: Text('Find your grade', textAlign:  TextAlign.start,),
                decoration: BoxDecoration(color: Colors.green,
                    border: Border.all()),
              ),

              ),

          ],
        ),
      ),

    );
  }
}

