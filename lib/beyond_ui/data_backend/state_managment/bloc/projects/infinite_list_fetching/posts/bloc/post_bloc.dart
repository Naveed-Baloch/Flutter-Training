import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_training/beyond_ui/data_backend/state_managment/bloc/projects/infinite_list_fetching/posts/bloc/post_event.dart';
import 'package:flutter_training/beyond_ui/data_backend/state_managment/bloc/projects/infinite_list_fetching/posts/bloc/post_state.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import '../../../../../../../../fundamentals/networking/network/domain/post.dart';

/// Concepts of Throttle / debouncing
/// We can use the drop the emissions after specific duration
/// there We can use this for search as well
///
/// For now we want to change/Transform the event so we can use the EventTransformer with throttler
const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;
  PostBloc({required this.httpClient}): super(PostState()) {
    on<PostFetched>(
        _onPostFetched,
        transformer: throttleDroppable(throttleDuration),
    );
  }


  Future<void> _onPostFetched(PostFetched event, Emitter<PostState> emit) async {
    if(state.hasReachedMax) return;
    try {
      final posts = await _fetchPosts(startIndex: state.posts.length);
      if (posts.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      }

      emit(
        state.copyWith(
          status: PostStatus.success,
          posts: [...state.posts, ...posts],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts({required int startIndex}) async {
    final response = await http.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Post(
          id: map['id'] as int,
          title: map['title'] as String,
          body: map['body'] as String,
        );
      }).toList();
    }
    throw Exception('error fetching posts');
  }
}
