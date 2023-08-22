// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  final dynamic usedId;
  final dynamic id;
  final String title;
  final bool completed;

  TodoModel({
    required this.completed,
    required this.title,
    required this.id,
    required this.usedId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'usedId': usedId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      usedId: map['usedId'] as dynamic,
      id: map['id'] as dynamic,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
