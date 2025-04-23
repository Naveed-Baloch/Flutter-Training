import 'package:flutter/foundation.dart';
import 'package:flutter_training/fundamentals/networking/network/repo/post_repo.dart';
import 'package:flutter_training/fundamentals/networking/utils/result.dart';

import '../network/domain/post.dart';

class PostViewModal extends ChangeNotifier {

  PostViewModal() {
    getPosts();
  }

  var posts = <Post>[];
  var isLoading = false;
  var error = "";
  final PostRepo postRepository = PostRepo();

  void getPosts() => postRepository.getPosts().listen((event) {
    switch(event) {
      case Loading(): {
        isLoading = true;
        error = "";
      }
      case Success(): {
        error = "";
        isLoading = false;
        posts = event.data;
      }
      case Failure(): {
        error = event.message ?? "Something went wrong";
        isLoading = false;
      }
    }
    notifyListeners();
  });
}
