import 'dart:convert';

class Person {
  final String Namestring; //App
  final int Scoreint; //android req
  final int Rankingint;
  final int ID;
  // List<int> Scoreweek;
  Person(
      {required this.Namestring,
      required this.Rankingint,
      required this.Scoreint,
      // required this.Scoreweek,
      required this.ID});
  factory Person.fromMap(Map<String, dynamic> json) => new Person(
        ID: json["ID"],
        Namestring: json["Namestring"],
        Rankingint: json["Rankingint"],
        Scoreint: json["Scoreint"],
        // Scoreweek: json["Scoreweek"]
      );

  Person PersonFromJson(String str) {
    final jsonData = json.decode(str);
    return Person.fromMap(jsonData);
  }

  String PersonToJson(Person data) {
    final dyn = data.toMap();
    return json.encode(dyn);
  }

  Map<String, dynamic> toMap() => {
        "ID": ID,
        "Namestring": Namestring,
        "Rankingint": Rankingint,
        "Scoreint": Scoreint,
        // "Scoreweek": Scoreweek,

        // "isFavorite": isFavorite,
      };
}
