import 'package:flutter/material.dart';

class TaskList {
  final int id;
  final String listName;
  final String iconName;
  final Color color;

  TaskList({
    required this.id,
    required this.listName,
    required this.iconName,
    required this.color,
  });

  factory TaskList.fromJson(Map<String, dynamic> json) {
    return TaskList(
      id: json['id'],
      listName: json['listName'],
      iconName: json['iconName'],
      color: Color(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'listName': listName,
      'iconName': iconName,
      'color': color.value,
    };
  }
}
