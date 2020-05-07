import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'bmi',
    home: new bmi(),
  ));
}

class bmi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new bmiState();
  }
}

class bmiState extends State<bmi>{

  double height;
  double weight;
  double bmi = 0.0;
  String msg='';
  TextEditingController heightController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();

  void _calculate(){
    height=double.parse(heightController.text);
    weight=double.parse(weightController.text);
    bmi = weight/(height*height);
    setState(() {
        if(bmi<18.5 && bmi>0)
          msg = 'Under Weight';
        else if(bmi>=18.5 && bmi<=24.9)
          msg = 'Normal';
        else if(bmi>=25.0 && bmi<=29.9)
          msg = 'OverWeight';
        else if(bmi>=30.0 && bmi<= 34.9)
          msg = 'obesity (class I)';
        else if(bmi>=35.0 && bmi<= 39.9)
          msg = 'obesity (class II)';
        else
          msg = 'Extreme obesity (class III)';
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset('images/bmilogo.png',height: 100.0,width: 100.0,),
          new Container(
            color: Colors.black12,
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: null,
                  decoration: InputDecoration(
                    labelText: "Age",
                    icon: new Icon(Icons.person_pin)
                  ),
                ),
                new TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                      labelText: "Height in mtr",
                      icon: new Icon(Icons.person_pin)
                  ),
                ),
                new TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                      labelText: "Weight in kg",
                      icon: new Icon(Icons.person_pin)
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 20.0)),
                new RaisedButton(onPressed: _calculate,
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  child: new Text("Calculate",style: TextStyle(fontSize: 17.0),),),
                new Padding(padding: EdgeInsets.only(top: 10.0))
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 10.0),
            alignment: Alignment.topCenter,
              child: new Column(
                children: <Widget>[
                  new Text("Your BMI : $bmi", style: TextStyle(fontSize: 25.0,color: Colors.blue),),
                  new Text("$msg", style: TextStyle(fontSize: 25.0,color: Colors.pink),)
                ],
              )
          )
        ],
      ),
    );
  }
}
