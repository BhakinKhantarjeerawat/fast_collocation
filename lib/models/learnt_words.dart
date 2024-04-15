// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LearntWords extends Equatable {
  const LearntWords({
    required this.id,
    required this.word,
  });
  final int id;
  final String word;

  @override 
  List<Object> get props => [id, word];

  @override
  bool get stringify => true;

  LearntWords copyWith({
    int? id,
    String? word,
  }) {
    return LearntWords(
      id: id ?? this.id,
      word: word ?? this.word,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'word': word,
    };
  }

  String toJson() => json.encode(toMap());

  // factory LearntWords.fromJson(String source) => LearntWords.fromMap(json.decode(source) as Map<String, dynamic>);

  factory LearntWords.fromMap(Map<String, dynamic> map) {
    return LearntWords(
      id: map['id'] as int,
      word: map['word'] as String,
    );
  }

  factory LearntWords.fromJson(String source) => LearntWords.fromMap(json.decode(source) as Map<String, dynamic>);
}
