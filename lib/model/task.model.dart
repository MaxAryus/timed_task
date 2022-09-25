class Task {
  final int id;
  final String name;
  final int listId;
  final DateTime dueTo;
  final String notes;
  final bool done;

  Task({
    required this.id,
    required this.name,
    required this.listId,
    required this.dueTo,
    required this.notes,
    required this.done,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      listId: json['list_id'],
      dueTo: DateTime.parse(json['due_to']),
      notes: json['notes'],
      done: json['done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'list_id': listId,
      'due_to': dueTo.toIso8601String(),
      'notes': notes,
      'done': done,
    };
  }
}
