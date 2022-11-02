// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromMap(jsonString);


// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

PokemonModel pokemonModelFromMap(String str) => PokemonModel.fromMap(json.decode(str));

String pokemonModelToMap(PokemonModel data) => json.encode(data.toMap());

class PokemonModel {
    PokemonModel({
        required this.id,
        required this.num,
        required this.name,
        required this.img,
        required this.type,
        required this.height,
        required this.weight,
        required this.candy,
        required this.candyCount,
        required this.egg,
        required this.spawnChance,
        required this.avgSpawns,
        required this.spawnTime,
        required this.multipliers,
        required this.weaknesses,
        required this.prevEvolution,
        required this.nextEvolution,
    });

    final int? id;
    final String? num;
    final String? name;
    final String? img;
    final List<String>? type;
    final String? height;
    final String? weight;
    final String? candy;
    final int? candyCount;
    final String? egg;
    final double? spawnChance;
    final double? avgSpawns;
    final String? spawnTime;
    final List<double>? multipliers;
    final List<String>? weaknesses;
    final List<Evolution>? prevEvolution;
    final List<Evolution>? nextEvolution;

    factory PokemonModel.fromMap(Map<String, dynamic> json) => PokemonModel(
        id: json["id"] == null ? null : json["id"],
        num: json["num"] == null ? null : json["num"],
        name: json["name"] == null ? null : json["name"],
        img: json["img"] == null ? null : json["img"],
        type: json["type"] == null ? null : List<String>.from(json["type"].map((x) => x)),
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        candy: json["candy"] == null ? null : json["candy"],
        candyCount: json["candy_count"] == null ? null : json["candy_count"],
        egg: json["egg"] == null ? null : json["egg"],
        spawnChance: json["spawn_chance"] == null ? null : json["spawn_chance"]!.toDouble(),
        avgSpawns: json["avg_spawns"] == null ? null : json["avg_spawns"]!.toDouble(),
        spawnTime: json["spawn_time"] == null ? null : json["spawn_time"],
        multipliers: json["multipliers"] == null ? null : List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: json["weaknesses"] == null ? null : List<String>.from(json["weaknesses"].map((x) => x)),
        prevEvolution: json["prev_evolution"] == null ? null : List<Evolution>.from(json["prev_evolution"].map((x) => Evolution.fromMap(x))),
        nextEvolution: json["next_evolution"] == null ? null : List<Evolution>.from(json["next_evolution"].map((x) => Evolution.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "num": num == null ? null : num,
        "name": name == null ? null : name,
        "img": img == null ? null : img,
        "type": type == null ? null : List<dynamic>.from(type!.map((x) => x)),
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
        "candy": candy == null ? null : candy,
        "candy_count": candyCount == null ? null : candyCount,
        "egg": egg == null ? null : egg,
        "spawn_chance": spawnChance == null ? null : spawnChance,
        "avg_spawns": avgSpawns == null ? null : avgSpawns,
        "spawn_time": spawnTime == null ? null : spawnTime,
        "multipliers": multipliers == null ? null : List<dynamic>.from(multipliers!.map((x) => x)),
        "weaknesses": weaknesses == null ? null : List<dynamic>.from(weaknesses!.map((x) => x)),
        "prev_evolution": prevEvolution == null ? null : List<dynamic>.from(prevEvolution!.map((x) => x.toMap())),
        "next_evolution": nextEvolution == null ? null : List<dynamic>.from(nextEvolution!.map((x) => x.toMap())),
    };

  @override
  String toString() {
    return 'PokemonModel(id: $id, num: $num, name: $name, img: $img, type: $type, height: $height, weight: $weight, candy: $candy, candyCount: $candyCount, egg: $egg, spawnChance: $spawnChance, avgSpawns: $avgSpawns, spawnTime: $spawnTime, multipliers: $multipliers, weaknesses: $weaknesses, prevEvolution: $prevEvolution, nextEvolution: $nextEvolution)';
  }
}

class Evolution {
    Evolution({
        required this.num,
        required this.name,
    });

    final String? num;
    final String? name;

    factory Evolution.fromMap(Map<String, dynamic> json) => Evolution(
        num: json["num"] == null ? null : json["num"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toMap() => {
        "num": num == null ? null : num,
        "name": name == null ? null : name,
    };

  @override
  String toString() => 'Evolution(num: $num, name: $name)';
}
