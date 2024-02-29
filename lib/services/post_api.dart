import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:post_river/models/post_model.dart';

class PostApi {
  Future<List<PostModel>> getPost() async {
    List<PostModel> postList = [];

    final url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = convert.jsonDecode(response.body);
      for (var list in responseBody) {
        var temp = PostModel.fromMap(list);
        postList.add(temp);
      }

      return postList;
    } else {
      return postList;
    }
  }

  listPost() async {
    final url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    var response = await http.get(url);
    return response;
  }

  PostModel addPost() {
    return PostModel(userId: 5, id: 10, title: 'title', body: 'body');
  }
}
