

import 'dart:convert';

Players playersFromJson(String str) => Players.fromJson(json.decode(str));

String playersToJson(Players data) => json.encode(data.toJson());

class Players {
    Players({
        required this.category,
        required this.description,
        required this.gamename,
        required this.location,
        required this.numberplayer,
        required this.role,
    });

    String category;
    String description;
    String gamename;
    String location;
    String numberplayer;
    String role;

    factory Players.fromJson(Map<String, dynamic> json) => Players(
        category: json["category"],
        description: json["description"],
        gamename: json["gamename"],
        location: json["location"],
        numberplayer: json["numberplayer"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "description": description,
        "gamename": gamename,
        "location": location,
        "numberplayer": numberplayer,
        "role": role,
    };
}
