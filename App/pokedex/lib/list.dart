import 'package:flutter/material.dart';
import 'package:pokedex/search.dart';
import 'package:pokedex/env.dart';
import 'package:pokedex/listFilteredByName.dart';
import "components/colorByType.dart";
import 'components/util.dart';

class MainList extends StatelessWidget {
  MainList({super.key});

  @override
  Widget build(BuildContext context) {
    Filter filter = new Filter();

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 23, 23, 23),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Pokedex',
            style: TextStyle(
              color: Color.fromARGB(255, 250, 250, 250),
            ),
          ),

          /*void _close() {
  Navigator.pop(context);
}*/
        ),
        body: Center(
          child: Row(
            children: [
              Container(
                width: 100,
                height: 200,
                child: Column(
                  children: [
                    IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.filter_alt,
                          color: Color.fromARGB(255, 234, 234, 234)),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ListFilteredByName(NAME: "zekrom"),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.search,
                          color: Color.fromARGB(255, 234, 234, 234)),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Search(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 400,
                  child: Center(
                    child:ListView(
                    itemExtent: 110,
                    physics: FixedExtentScrollPhysics(),
                    children: createList(filter),
                    )),
                  )
            ],
          ),
        ));
  }

  createItem(int id) {
    var item = Container(
        child: Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 80, 80, 80),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Image.asset(
            "images/" + id.toString() + ".png",
            width: 96,
            height: 96,
          ),
        ),
        Text("  " + id.toString(),
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 119, 119, 119)))
      ],
    ));

    return item;
  }

  List<Widget> createList(Filter filter) {
    List<Widget> list = [];
    for (int i = 1; i <= 905; i++) {
        Color color1 = colorByType(filter.getType1(i));
        Color color2 = color1;

        if (filter.getType2(i).toString().compareTo("none") == 0) {
          final color2V = HSLColor.fromColor(color1);
          final color2Value =
              color2V.withLightness((color2V.lightness + 0.5).clamp(0.0, 1.0));
          color2 = color2Value.toColor();
        } else {
          color2 = colorByType(filter.getType2(i));
        }
        var item = Container(
            child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Image.asset(
                "images/" + i.toString() + ".png",
                width: 96,
                height: 96,
              ),
            ),
            Text("  " + i.toString(),
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 119, 119, 119)))
          ],
        ));

        list.add(item);
    }
    return list;
  }
}
