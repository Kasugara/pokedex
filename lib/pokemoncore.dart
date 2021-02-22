import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Pokemons {
  List<BasePokemon> pokemons = [];

  Pokemons.fromJson(List<dynamic> json) {
    if (json == null) return;

    json.forEach((item) {
      final pokemon = BasePokemon.fromJson(item);
      pokemons.add(pokemon);
    });
  }
}

class BasePokemon {
  String name;
  String url;

  BasePokemon({
    this.name,
    this.url,
  });

  factory BasePokemon.fromJson(Map<String, dynamic> json) {
    return BasePokemon(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon {
  int id;
  String name;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  List<Species> forms;
  int weight;
  int height;

  Pokemon({
    this.id,
    this.name,
    @required this.weight,
    @required this.height,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.forms,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        height: json["height"],
        //misal mau ambil sebagian image aja : imageUrl: json['sprites']['front_Default]
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        forms: List<Species>.from(
          json["forms"].map((x) => Species.fromJson(x)),
        ),
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
      );
}

class Species {
  String name;
  String url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );
}

class Stat {
  int baseStat;
  Species stat;

  Stat({
    this.baseStat,
    this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        stat: Species.fromJson(json["stat"]),
      );
}

class Type {
  Species type;

  Type({
    this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: Species.fromJson(json["type"]),
      );
}
