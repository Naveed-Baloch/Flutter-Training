class PostRsp {
  final int id;
  final String title;
  final String body;

  PostRsp({required this.id, required this.title, required this.body});

  factory PostRsp.fromJson(Map<String, dynamic> json) {
    return PostRsp(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'body': body};
}
