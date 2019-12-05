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
  String t1, t2, result = '';
  double n2;
  GradeCalculate mygrade = GradeCalculate();

  void _incrementCounter() {
    setState(() {
      result = mygrade.getLetterGrade(t1, n2);
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
                  child: Text(result,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'courier',
                        fontWeight: FontWeight.w300,
                        backgroundColor: Colors.yellow,
                        color: Colors.black,
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
                n2 = double.parse(t2);
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
class GradeCalculate{
  double grade = 0.0;
  String _letter ='', name = '';
  GradeCalculate({this.name,this.grade,});
  String getLetterGrade (name, grade){
    if (grade < 100.0  && grade >= 90.0)
        _letter = 'A';
    else if (grade >= 80.0)
      _letter = 'B';
    else if (grade >= 70.0)
      _letter = 'C';
    else if (grade >= 60.0)
      _letter = 'D';
    else if (grade < 60 && grade >= 0)
      _letter = 'F';

    return name + ' Grade is an ' + _letter ;
  }
}
