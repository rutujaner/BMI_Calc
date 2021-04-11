import 'package:bmi_cal/Result.dart';
import 'package:flutter/material.dart';
import 'Reusablecard.dart';
import 'Result.dart';
import 'Logic.dart';

int age = 20;
int weight = 60;
int height = 180;
Color male = Colors.blueGrey[200];
Color female = Colors.redAccent[100];

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(   //1R
              child: Row(
                children: [
                  Expanded(
                    //1R,1C
                    child: Reusablecard(
                      cardcolor: male,
                      detector: () {
                        setState(() {
                          male = male == Colors.blueGrey[200]
                              ? Colors.blueGrey[600]
                              : Colors.blueGrey[200];
                          female = female == Colors.redAccent[200]
                              ? Colors.redAccent[100]
                              : Colors.redAccent[100];
                        });
                      },
                      containerchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Icon(Icons.arrow_back),
                          Text("MALE",style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    //1R,2C
                    child: Reusablecard(
                      cardcolor: female,
                      detector: () {
                        setState(() {
                          female = female == Colors.redAccent[100]
                              ? Colors.redAccent[200]
                              : Colors.redAccent[100];
                          male = male == Colors.blueGrey[600]
                              ? Colors.blueGrey[200]
                              : Colors.blueGrey[200];
                        });
                      },
                      containerchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("FEMALE",style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(   //2R
              child: Row(
                children: [
                  Expanded(
                    //2R
                    child: Reusablecard(
                      cardcolor: Colors.orange[300],
                      containerchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("HEIGHT",style: TextStyle(fontSize: 20.0),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                height.toString(),
                                style: TextStyle(fontSize: 40.0),
                              ),
                              Text("cm"),
                            ],
                          ),
                          Slider(
                            value: height.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            },
                            min: 100,
                            max: 300,
                            activeColor: Color(0xFF40E0D0),
                            inactiveColor: Color(0xFF00CED1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(   //3R
              child: Row(
                children: [
                  Expanded(
                    //3R,1C
                    child: Reusablecard(
                      cardcolor: Colors.pink[300],
                      containerchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE",style: TextStyle(fontSize: 20.0),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                age.toString(),
                                style: TextStyle(fontSize: 40.0),
                              ),
                              Text("yrs"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: FlatButton(
                                  child: Icon(Icons.arrow_left),
                                  onPressed: () {
                                    setState(() {
                                      age = age - 1;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: FlatButton(
                                  child: Icon(Icons.arrow_right),
                                  onPressed: () {
                                    setState(() {
                                      age = age + 1;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    //3R,2C
                    child: Reusablecard(
                      cardcolor: Colors.indigo[300],
                      containerchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT",style: TextStyle(fontSize: 20.0),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weight.toString(),
                                style: TextStyle(fontSize: 40.0),
                              ),
                              Text("KG"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: FlatButton(
                                  child: Icon(Icons.arrow_left),
                                  onPressed: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: FlatButton(
                                  child: Icon(Icons.arrow_right),
                                  onPressed: () {
                                    setState(() {
                                      weight = weight + 1;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.green[600],
              child: FlatButton(
                child: Text("CALCULATE", style: TextStyle(fontSize: 20.0),),
                onPressed: () {
                  Logic bmi=Logic(
                    height: height,
                    weight: weight,
                  );


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Result(
                        y: bmi.calculateBMI(),
                        x: bmi.weightstatus(),
                        z: bmi.comments(),
                      );
                    }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
