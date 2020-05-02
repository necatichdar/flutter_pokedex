import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_details.dart';

import 'model/pokedex.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Pokedex pokedex;
  Future<Pokedex> veri;

  Future<Pokedex> pokemonlariGetir() async {
    var response = await http.get(url);
    var decodedJson = json.decode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = pokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return FutureBuilder(
              future: veri,
              builder:
                  (BuildContext context, AsyncSnapshot<Pokedex> gelenPokedex) {
                if (gelenPokedex.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (gelenPokedex.connectionState ==
                    ConnectionState.done) {
//            return GridView.builder(
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2,
//              ),
//              itemBuilder: (context, index) {
//                return Text(gelenPokedex.data.pokemon[index].name);
//              },
//            );
                  return GridView.count(
                    crossAxisCount: 2,
                    children: gelenPokedex.data.pokemon.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PokemonDetail(
                              pokemon: poke,
                            );
                          }));
                        },
                        child: Hero(
                            tag: poke.img,
                            child: Card(
                              elevation: 10,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      height: 120,
                                      child: FadeInImage.assetNetwork(
                                        placeholder: "assets/gif.gif",
                                        image: poke.img,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    poke.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      );
                    }).toList(),
                  );
                }
              },
            );
          } else {
            return FutureBuilder(
              future: veri,
              builder: (BuildContext context, AsyncSnapshot<Pokedex> gelenPokedex) {
                if (gelenPokedex.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (gelenPokedex.connectionState == ConnectionState.done) {
//            return GridView.builder(
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2,
//              ),
//              itemBuilder: (context, index) {
//                return Text(gelenPokedex.data.pokemon[index].name);
//              },
//            );
                  return GridView.extent(
                    maxCrossAxisExtent: 350,
                    children: gelenPokedex.data.pokemon.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PokemonDetail(pokemon: poke,);
                          }));
                        },
                        child: Hero(
                            tag: poke.img,
                            child: Card(
                              elevation: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 200,
                                    width: 150,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/gif.gif",
                                      image: poke.img,fit: BoxFit.contain,),
                                  ),
                                  Text(
                                    poke.name,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      );
                    }).toList(),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
