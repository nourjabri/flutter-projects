// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TripModel {
  String title;
  String starting_place;
  String arrival_place;
  String duration_days;
  String cost_per_person;
  String image_url;
  TripModel({
    required this.title,
    required this.starting_place,
    required this.arrival_place,
    required this.duration_days,
    required this.cost_per_person,
    required this.image_url,
  });

  TripModel copyWith({
    String? title,
    String? starting_place,
    String? arrival_place,
    String? duration_days,
    String? cost_per_person,
    String? image_url,
  }) {
    return TripModel(
      title: title ?? this.title,
      starting_place: starting_place ?? this.starting_place,
      arrival_place: arrival_place ?? this.arrival_place,
      duration_days: duration_days ?? this.duration_days,
      cost_per_person: cost_per_person ?? this.cost_per_person,
      image_url: image_url ?? this.image_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'starting_place': starting_place,
      'arrival_place': arrival_place,
      'duration_days': duration_days,
      'cost_per_person': cost_per_person,
      'image_url': image_url,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      title: map['title'] as String,
      starting_place: map['starting_place'] as String,
      arrival_place: map['arrival_place'] as String,
      duration_days: map['duration_days'] as String,
      cost_per_person: map['cost_per_person'] as String,
      image_url: map['image_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TripModel.fromJson(String source) =>
      TripModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TripModel(title: $title, starting_place: $starting_place, arrival_place: $arrival_place, duration_days: $duration_days, cost_per_person: $cost_per_person, image_url: $image_url)';
  }

  @override
  bool operator ==(covariant TripModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.starting_place == starting_place &&
        other.arrival_place == arrival_place &&
        other.duration_days == duration_days &&
        other.cost_per_person == cost_per_person &&
        other.image_url == image_url;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        starting_place.hashCode ^
        arrival_place.hashCode ^
        duration_days.hashCode ^
        cost_per_person.hashCode ^
        image_url.hashCode;
  }
}
