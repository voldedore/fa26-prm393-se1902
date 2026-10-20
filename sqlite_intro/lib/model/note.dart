class Note {
  int id;
  String title;
  String content;

  Note(this.id, this.title, this.content);

  // fromJson
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(json['id'], json['title'], json['content']);
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'content': content};
  }


  // @freezed
}
