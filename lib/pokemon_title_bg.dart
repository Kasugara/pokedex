import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemoncore.dart';
import 'main.dart';

class MyHomePage extends StatefulWidget {
  static const String url =
      'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Pokemons pokemons;

  Color bgColor = Color(0xFF393636);
  Future<List<Pokemons>> _fetchData() async {
    final response = await http.get(MyHomePage.url);
    final decode = json.decode(response.body);
    final data = Pokemons.fromJson(decode['results']);
    print(data.pokemons);

    setState(() {
      pokemons = data;
    });
  }

  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pokedex"),
        centerTitle: true,
      ),
      body: Container(
        child: pokemons == null
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                    pokemons.pokemons.length,
                    (index) => PokeCard(
                          pokeURL: pokemons.pokemons[index].url,
                        )),
              ),
      ),
    );
  }
}
