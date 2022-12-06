import 'package:flutter/material.dart';

Color colorByType(String type) {
  switch (type) {
    case "bug":
      return Color.fromARGB(255, 172, 238, 66);
      break;
    case "dark":
      return Color.fromARGB(255, 73, 80, 117);
      break;
    case "dragon":
      return Color.fromARGB(255, 96, 70, 223);
      break;
    case "electric":
      return Color.fromARGB(255, 235, 238, 66);
      break;
    case "fairy":
      return Color.fromARGB(255, 250, 104, 243);
      break;
    case "fighting":
      return Color.fromARGB(255, 238, 92, 66);
      break;
    case "fire":
      return Color.fromARGB(255, 238, 66, 66);
      break;
    case "flying":
      return Color.fromARGB(255, 135, 181, 228);
      break;
    case "ghost":
      return Color.fromARGB(255, 66, 83, 238);
      break;
    case "grass":
      return Color.fromARGB(255, 66, 238, 118);
      break;
    case "ground":
      return Color.fromARGB(255, 238, 169, 66);
      break;
    case "ice":
      return Color.fromARGB(255, 66, 232, 238);
      break;
    case "normal":
      return Color.fromARGB(255, 179, 179, 179);
      break;
    case "poison":
      return Color.fromARGB(255, 198, 66, 238);
      break;
    case "psychic":
      return Color.fromARGB(255, 238, 66, 172);
      break;
    case "rock":
      return Color.fromARGB(255, 238, 115, 66);
      break;
    case "steel":
      return Color.fromARGB(255, 211, 211, 211);
      break;
    case "water":
      return Color.fromARGB(255, 66, 152, 238);
      break;

    default:
      break;
  }
  return Color(0);
}
