// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatModel {
  String message;
  bool is_me;
  ChatModel({
    required this.message,
    required this.is_me,
  });

  ChatModel copyWith({
    String? message,
    bool? is_me,
  }) {
    return ChatModel(
      message: message ?? this.message,
      is_me: is_me ?? this.is_me,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'is_me': is_me,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      message: map['message'] as String,
      is_me: map['is_me'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatModel(message: $message, is_me: $is_me)';

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.is_me == is_me;
  }

  @override
  int get hashCode => message.hashCode ^ is_me.hashCode;
}
