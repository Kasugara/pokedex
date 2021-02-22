import 'package:flutter/material.dart';
import 'pokemoncore.dart';

///THIS CONTAIN DETAIL OF EVERY POKEMON
// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  Pokemon pokemon;

  Color bgColor = Color(0xFF171515);
  DetailPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("P@kedex"),
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Return to list",
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: pokemon == null
                ? Center(
                    child: Text('ggwp'),
                  )
                : Center(
                    child: Text(
                    '#0${pokemon.id.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                        color: Colors.black),
                  )),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(alignment: Alignment.center, children: [
            Image(
              image: NetworkImage(pokemon.sprites.frontDefault),
              height: 400,
              width: 400,
              fit: BoxFit.fill,
            )
          ]),
          Text(
            pokemon.name,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 40,
                color: Colors.black,
                letterSpacing: 3),
          ),
          Expanded(
            child: Container(
              height: 1,
              child: ListView.builder(
                  itemCount: pokemon.types.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 1),
                      child: Text(
                        pokemon.types[index].type.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('${pokemon.weight / 10} Kg',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: Colors.black,
                        )),
                    Text('Weight',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 27,
                          color: Colors.black,
                        )),
                  ],
                ),
                Column(
                  children: [
                    Text('${pokemon.height / 10} M',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: Colors.black,
                        )),
                    Text('Height',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 27,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              "Stats",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 50,
                  color: Colors.purple,
                  decoration: TextDecoration.none,
                  letterSpacing: 5),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: pokemon.stats.length,
                itemBuilder: (context, index) {
                  final poke = pokemon.stats[index];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(225, 5, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          '${poke.stat.name} = ${poke.baseStat}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
