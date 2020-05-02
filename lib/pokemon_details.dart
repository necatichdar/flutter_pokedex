import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(
        builder: (context, oriantation) {
          if (oriantation == Orientation.portrait) {
            return dikeyBody(context);
          } else {
            return yatayBody(context);
          }
        },
      ),
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: MediaQuery.of(context).size.height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                width: 200,
                child: Image.network(
                  pokemon.img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Height : ${pokemon.height}",
                  ),
                  Text(
                    "Weight : ${pokemon.weight}",
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map(
                          (e) => Chip(
                            backgroundColor: Colors.deepOrange[300],
                            label: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Text(
                    "Prev Evolution",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map(
                              (evolution) => Chip(
                                backgroundColor: Colors.deepOrange[300],
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList()
                        : [
                            Chip(
                              backgroundColor: Colors.deepOrange[300],
                              label: Text(
                                "None",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                  ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map(
                              (evolution) => Chip(
                                backgroundColor: Colors.deepOrange[300],
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList()
                        : [
                            Chip(
                              backgroundColor: Colors.deepOrange[300],
                              label: Text(
                                "None",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map(
                              (evolution) => Chip(
                                backgroundColor: Colors.deepOrange[300],
                                label: Text(
                                  evolution,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                            .toList()
                        : [
                            Chip(
                              backgroundColor: Colors.deepOrange[300],
                              label: Text(
                                "None",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * 7 / 11,
          width: MediaQuery.of(context).size.width - 20,
          //left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Height : ${pokemon.height}",
                ),
                Text(
                  "Weight : ${pokemon.weight}",
                ),
                Text(
                  "Types",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map(
                        (e) => Chip(
                          backgroundColor: Colors.deepOrange[300],
                          label: Text(
                            e,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Text(
                  "Prev Evolution",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.prevEvolution != null
                      ? pokemon.prevEvolution
                          .map(
                            (evolution) => Chip(
                              backgroundColor: Colors.deepOrange[300],
                              label: Text(
                                evolution.name,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList()
                      : [
                          Chip(
                            backgroundColor: Colors.deepOrange[300],
                            label: Text(
                              "None",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                ),
                Text(
                  "Next Evolution",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution != null
                      ? pokemon.nextEvolution
                          .map(
                            (evolution) => Chip(
                              backgroundColor: Colors.deepOrange[300],
                              label: Text(
                                evolution.name,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList()
                      : [
                          Chip(
                            backgroundColor: Colors.deepOrange[300],
                            label: Text(
                              "None",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                ),
                Text(
                  "Weakness",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses != null
                      ? pokemon.weaknesses
                          .map(
                            (evolution) => Chip(
                              backgroundColor: Colors.deepOrange[300],
                              label: Text(
                                evolution,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList()
                      : [
                          Chip(
                            backgroundColor: Colors.deepOrange[300],
                            label: Text(
                              "None",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(
                pokemon.img,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      ],
    );
  }
}
