import 'package:flutter/material.dart';
import 'colorByType.dart';

extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
    }
}

class typesShow extends StatelessWidget {
  String type1;
  String type2;
  Color color1 = Color.fromARGB(255, 255, 255, 255);
  Color color2 = Color.fromARGB(255, 255, 255, 255);

  typesShow({required this.type1, required this.type2});

  @override
  Widget build(BuildContext context) {
    color1 = colorByType(type1);
    color2 = colorByType(type2);

    if(type2=="none"){
          return Container(
        child: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            width: 125,
            height: 25,
            child: Center(
                child: Text(
              type1.capitalize(),
              style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,),
              
            )),
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )),
        ),
      ],
    )));
    }



    else{
          return Container(
        child: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            width: 125,
            height: 25,
            child: Center(
                child: Text(
              type1.capitalize(),
              style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,),
              
            )),
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            width: 125,
            height: 25,
            child: Center(
                child: Text(
              type2.capitalize(),
              style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,),
            )),
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )),
        ),
      ],
    )));
    }
  }
}
