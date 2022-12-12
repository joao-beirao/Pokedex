import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Pokemon {
  bool isReady = false;

  static final String IMG_URL =
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/";

  int id = 0;
  String name = "";
  String type1 = "";
  String type2 = "";
  String image_url = "";

  double weight = 0;
  double height = 0;

  int hp = 0;
  int attack = 0;
  int defense = 0;
  int speed = 0;
  double median = 0;
  int total = 0;

  Pokemon() {
    this.hp = 50;
    this.attack = 150;
    this.defense = 130;
    this.speed = 123;
    this.median = (hp + attack + defense + speed).toDouble();
    this.median = this.median / 4;
    this.total = ((median).round());
    this.weight = 12.2;
    this.height = 21;
  }

  Future getPokemonData(int _id) async {
    id = _id;

    var response = await http.get(
        Uri.https(("pokeapi.co"), ("/api/v2/pokemon/" + _id.toString() + "/")));
    var jsonData = jsonDecode(response.body);

    String text = jsonData["forms"][0]["name"].toString();
    name = text[0].toUpperCase() + text.substring(1);

    type1 = jsonData["types"][0]["type"]["name"].toString();

    print("CONTAINS: " +
        jsonData["types"].toString().contains("slot: 2").toString());

    print(jsonData["types"].toString());

    if (jsonData["types"].toString().contains("slot: 2")) {
      type2 = jsonData["types"][1]["type"]["name"].toString();
    } else {
      type2 = "none";
    }

    height = jsonData["height"].toDouble();
    if (height % 10 == 0) {
      height = (height / 10).round().toDouble();
    } else {
      height = height / 10;
    }

    weight = jsonData["weight"].toDouble();
    if (weight % 10 == 0) {
      weight = (weight / 10).round().toDouble();
    } else {
      weight = weight / 10;
    }

    image_url = IMG_URL + id.toString() + ".png";
    hp = jsonData["stats"][0]["base_stat"];
    attack = jsonData["stats"][1]["base_stat"];
    defense = jsonData["stats"][2]["base_stat"];
    speed = jsonData["stats"][5]["base_stat"];
    median = (hp + attack + defense + speed).toDouble();
    median = median / 4;
    total = median.round();

    return 1;
  }
}
