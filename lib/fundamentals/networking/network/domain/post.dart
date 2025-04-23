import '../dto/post_rsp.dart';

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});
}

extension PostRspExts on PostRsp {
  Post toDomain() => Post(id: id, title: title, body: body);
}