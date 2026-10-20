class Note {
  final int id;
  final String title;
  final String content;

  Note(this.id, this.title, this.content);

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content
    };
  }

  // fromJson
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(json['id'], json['title'], json['content']);
  }


}