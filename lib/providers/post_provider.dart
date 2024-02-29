import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:post_river/models/post_model.dart';
import 'package:post_river/services/post_api.dart';
import 'package:flutter/foundation.dart';

@immutable
class PostState {}

class InitalPostState extends PostState {
  InitalPostState({required this.posts});
  List<PostModel> posts;
}

class LoadingPostState extends PostState {}

class LoadedPostState extends PostState {
  LoadedPostState({required this.posts});
  List<PostModel> posts;
}

class ErrorPostState extends PostState {
  final String error;

  ErrorPostState({required this.error});
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier()
      : super(InitalPostState(posts: [
          PostModel(userId: 5, id: 10, title: 'title', body: 'body')
        ]));

  loadPost() async {
    state = LoadingPostState();
    try {
      List<PostModel> posts = await PostApi().getPost();

      state = LoadedPostState(posts: posts);
    } catch (e) {
      state = ErrorPostState(error: 'Something went wrong');
    }
  }

  addPost() async {
    var newPost = PostApi().addPost();
    var oldPosts = (state as LoadedPostState).posts;
    oldPosts.add(newPost);
    state = LoadedPostState(posts: oldPosts);
  }
}

final postProvider =
    StateNotifierProvider<PostNotifier, PostState>((ref) => PostNotifier());

// final postFutureProvider = FutureProvider<PostState>((ref) {});
