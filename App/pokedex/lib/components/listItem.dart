import 'package:flutter/material.dart';
import 'package:pokedex/individualLook.dart';
import 'package:pokedex/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/individualLook.dart';
import 'package:pokedex/pokemon.dart';
import "colorByType.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:circle_list/circle_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListItem extends StatelessWidget {
  int id;
  
  ListItem({required this.id, required});

  @override
  Widget build(BuildContext context) {
    TextEditingController textInput = new TextEditingController();

    var item = new InkWell(
        onTap: () {
          openItem(1, this);
        },
        child:Container(
      width: 200,
      height: 50,
      child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
    );

    return item;
  }

  openItem(int id, context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => individualLook(id: id),
        ));
  }
}
