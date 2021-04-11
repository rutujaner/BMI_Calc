import 'package:flutter/material.dart';

class Reusablecard extends StatelessWidget {
  final Color cardcolor;
  final Widget containerchild;
  final Function detector;
  
  Reusablecard({@required this.cardcolor, @required this.containerchild, this.detector});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: detector,
          child: Container(
          color: cardcolor,
          child: containerchild,
          margin: EdgeInsets.all(20.0),
          ),
    );
  }
}