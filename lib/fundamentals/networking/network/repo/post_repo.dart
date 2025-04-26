import 'dart:convert';

import 'package:flutter_training/fundamentals/networking/config/Constants.dart';
import 'package:flutter_training/fundamentals/networking/network/domain/post.dart';
import 'package:flutter_training/fundamentals/networking/network/dto/post_rsp.dart';
import 'package:flutter_training/fundamentals/networking/utils/result.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  final List<Post> _posts = [];

  Stream<Result> getPosts() async* {
    if (_posts.isNotEmpty) {
      print("from cache");
      yield Success(_posts);
      return;
    }
    yield Loading();
    try {
      var response = await http.get(
        Uri.parse(AppConstants.baseUrl + AppConstants.posts),
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final posts =
            json
                .map((e) => PostRsp.fromJson(e).toDomain())
                .toList()
                .cast<Post>();
        _posts.addAll(posts);
        yield Success(posts);
        print("from network");
      } else {
        yield Failure("Failed to load posts");
      }
    } catch (e) {
      yield Failure(e.toString());
    }
  }
}
