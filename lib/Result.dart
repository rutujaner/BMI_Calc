import 'package:flutter/material.dart';
import 'Reusablecard.dart';

class Result extends StatelessWidget {
  final String x;
  final String y;
  final String z;

  Result({this.x, this.y, this.z});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                child: Reusablecard(
                  cardcolor: Colors.grey[400],
                  containerchild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(x,
                        style: TextStyle(
                            fontSize: 35, fontFamily: '.SF UI Display'),
                      ),
                      Text(y,
                      style: TextStyle(
                            fontSize: 40, fontFamily: '.SF UI Display'),
                      ),
                      Text(z,
                      style: TextStyle(
                            fontSize: 20, fontFamily: '.SF UI Display'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.lightBlue,
                child: FlatButton(
                  child: Text("RE-CALCULATE", style: TextStyle(fontSize: 20.0),),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
