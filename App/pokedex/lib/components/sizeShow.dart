import 'package:flutter/material.dart';

class sizeShow extends StatelessWidget {
    double weight;
    double height;

  sizeShow({required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {


    return Container(
        child: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
          child:Column(children: [Container(
              width: 150,
              height: 30,
              child:Column(children: [Center(
                  child: Text(
                "Weight", 
                style: TextStyle(
                color: Color.fromARGB(255, 175, 175, 175),
                fontSize: 20,
              ))),]),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )),
              Container(
              width: 150,
              height: 50,
              child:Column(children: [Center(
                  child: Text(
                weight.toString().replaceAll(".0", '') + " Kg", 
                style: TextStyle(
                color: Color.fromARGB(255, 250, 250, 250),
                fontSize: 35,
              ))),]),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),),),
        ],),), 
        Padding(
          padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: Column(children: [Container(
              width: 150,
              height: 30,
              child:Column(children: [Center(
                  child: Text(
                "Height", 
                style: TextStyle(
                color: Color.fromARGB(255, 175, 175, 175),
                fontSize: 20,
              ))),]),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )),Container(
              width: 150,
              height: 50,
              child:Column(children: [Center(
                  child: Text(
                height.toString().replaceAll(".0", '') +" M", 
                style: TextStyle(
                color: Color.fromARGB(255, 250, 250, 250),
                fontSize: 35,
              ))),]),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              )),],)
        ),
      ],
    )));
  }
}
