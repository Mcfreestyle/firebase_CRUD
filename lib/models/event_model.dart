import 'dart:convert';

class Event {
  String? id;
  String name;
  String date;
  String place;
  String image;

  Event({
    this.id,
    required this.name,
    required this.date,
    required this.place,
    required this.image,
  });

  factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        name: json["name"],
        date: json["date"],
        place: json["place"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "date": date,
        "place": place,
        "image": image,
      };

  Event copyWith() {
    return Event(
      name: name,
      date: date,
      place: place,
      image: image,
      id: id,
    );
  }
}
