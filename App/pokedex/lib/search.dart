import 'package:flutter/material.dart';
import 'package:pokedex/individualLook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokedex/listFilteredByName.dart';

class Search extends StatelessWidget {
  Search({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textInput1 = new TextEditingController();
    TextEditingController textInput2 = new TextEditingController();
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
        child: Column(
          children: [
            Center(
                child: Column(
              children: [
                SizedBox(
                  width: 300.0,
                  child: TextField(
                    onChanged: (String value) async {
                      textInput2.clear();
                    },
                    controller: textInput1,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(255, 250, 250, 250)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 197, 197, 197),
                      ),
                      hintText: 'NAME',
                    ),
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(
                      color: Color.fromARGB(255, 73, 73, 73), fontSize: 20),
                ),
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    onChanged: (String value) async {
                      textInput1.clear();
                    },
                    controller: textInput2,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(255, 250, 250, 250)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 197, 197, 197),
                      ),
                      hintText: 'ID',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (textInput1.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ListFilteredByName(NAME: textInput1.text),
                          ));
                    }
                    if (int.parse(textInput2.text) <= 905 &&
                        int.parse(textInput2.text) > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                individualLook(id: int.parse(textInput2.text))),
                      );
                    } else {
                      Fluttertoast.showToast(msg: "Invalid Value!");
                    }
                  },
                  child: const Text('SEARCH'),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  getIndividualLook(int id, context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => individualLook(id: id),
        ));
  }
}
