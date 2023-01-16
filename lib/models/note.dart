// ignore_for_file: public_member_api_docs, sort_constructors_first

class Note {
  int? id;
  String title;
  String content;

  Note({this.id, this.title = "Note", this.content = "Text"});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    data['title'] = title;
    data['content'] = content;
    return data;
  }

  @override
  toString() {
    return {
      'id': id,
      'title': title,
      'content': content,
    }.toString();
  }
}
