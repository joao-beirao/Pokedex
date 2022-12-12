import 'package:flutter/material.dart';
import 'package:pokedex/list.dart';
import 'package:pokedex/pokemon.dart';
import 'package:pokedex/search.dart';
import "components/colorByType.dart";
import "components/progressBar.dart";
import "components/typesShow.dart";
import "components/sizeShow.dart";
import 'package:http/http.dart' as http;

Pokemon pokemon = Pokemon();

class individualLook extends StatelessWidget {
  int id;
  individualLook({required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 23, 23, 23),
        body: SingleChildScrollView(
          child: Column(
            children: [MainLook(ID: id)],
          ),
        ));
  }
}

class MainLook extends StatefulWidget {
  int ID;

  int MAX_ID = 905;
  MainLook({
    required this.ID,
  });

  @override
  _MainLook createState() => _MainLook(id: ID);
}

class _MainLook extends State<MainLook> {
  int id;
  _MainLook({required this.id});
  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
          future: pokemon.getPokemonData(id),
          builder: ((context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              //navigate(context, id.toString());
              return Column(
                children: [
                  MainImage(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                        color: Color.fromARGB(255, 250, 250, 250),
                        fontSize: 35,
                      ),
                    ),
                  ),
                  typesShow(
                    type1: pokemon.type1,
                    type2: pokemon.type2,
                  ),
                  sizeShow(weight: pokemon.weight, height: pokemon.height),
                  StatsPresenter(),
                ],
              );
            }
          }));
    }
  }


class MainImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color1 = colorByType(pokemon.type1);
    Color color2;
    if (pokemon.type2 == "none") {
      final color2V = HSLColor.fromColor(color1);
          final color2Value =
              color2V.withLightness((color2V.lightness + 0.5).clamp(0.0, 1.0));
          color2 = color2Value.toColor();
    } else {
      color2 = colorByType(pokemon.type2);
    }


    return Container(
      height: 280,
      constraints: BoxConstraints(minWidth: 250, maxWidth: 700),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            color1,
            color2,
          ],
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 35, 0, 0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color.fromARGB(255, 23, 23, 23)),
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ),
                    (route) => false,
                  ),
                ),
              ),
            ],
          ),
          Column(mainAxisSize: MainAxisSize.max, children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Image.network(
                  pokemon.image_url,
                  width: 250,
                  height: 250,
                ),
              ),
            ),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 45, 0, 0),
                  child: Text(
                    "#" + pokemon.id.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 23, 23, 23)),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class StatsPresenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          constraints: BoxConstraints(minWidth: 250, maxWidth: 700),
          child: Column(children: [
            Text(
              "Base Stats",
              style: TextStyle(
                  color: Color.fromARGB(255, 250, 250, 250), fontSize: 25),
            ),
            Stat(
              label: "Hp",
              value: pokemon.hp,
              color: Color.fromARGB(215, 118, 255, 125),
            ),
            Stat(
              label: "Attack",
              value: pokemon.attack,
              color: Color.fromARGB(214, 255, 120, 120),
            ),
            Stat(
              label: "Defense",
              value: pokemon.defense,
              color: Color.fromRGBO(124, 218, 255, 0.843),
            ),
            Stat(
              label: "Speed",
              value: pokemon.speed,
              color: Color.fromARGB(255, 255, 221, 109),
            ),
            Stat(
              label: "Total",
              value: pokemon.total,
              color: Color.fromARGB(213, 243, 243, 243),
            ),
          ]),
        ));
  }
}

class Stat extends StatelessWidget {
  String label;
  int value;
  Color color;

  Stat({required this.label, required this.value, required this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Color.fromARGB(255, 175, 175, 175),
                  ),
                  textAlign: TextAlign.start,
                ),
              )),
          progressBar(label: label, value: value, color: color)
        ],
      ),
    );
  }
}
