class Note {
  int? id;
  String title;
  String content;

  Note({this.id, required this.title, required this.content});

  // fromJson
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(id: json['id'], title: json['title'], content: json['content']);
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'content': content};
  }


  // @freezed
}
