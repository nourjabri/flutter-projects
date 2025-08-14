// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Bookmodel {
  String title;
  String descrption;
  String author; 
  Bookmodel({
    required this.title,
    required this.descrption,
    required this.author,
  });

  Bookmodel copyWith({
    String? title,
    String? descrption,
    String? author,
  }) {
    return Bookmodel(
      title: title ?? this.title,
      descrption: descrption ?? this.descrption,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'descrption': descrption,
      'author': author,
    };
  }

  factory Bookmodel.fromMap(Map<String, dynamic> map) {
    return Bookmodel(
      title: map['title'] as String,
      descrption: map['descrption'] as String,
      author: map['author'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bookmodel.fromJson(String source) => Bookmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Bookmodel(title: $title, descrption: $descrption, author: $author)';

  @override
  bool operator ==(covariant Bookmodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.descrption == descrption &&
      other.author == author;
  }

  @override
  int get hashCode => title.hashCode ^ descrption.hashCode ^ author.hashCode;
}
