import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:instagram/data/model/comments.dart';
import 'package:instagram/data/model/post.dart';
import 'package:instagram/data/model/users.dart';

class Api {
  static const String baseUrl = "https://dummyjson.com";

  Future<List<User>> fetchUsers() async {
    final url = Uri.parse("$baseUrl/users");
    final response = await http.get(url);

    log(response.body);
    try {
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> usersList = jsonData["users"];

        return usersList.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception("Failed to fetch products: ${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse("$baseUrl/posts");
    final response = await http.get(url);

    log(response.body);
    try {
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> postList = jsonData["posts"];

        return postList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception("Failed to fetch products: ${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Comments>> fetchComments() async {
    final url = Uri.parse("$baseUrl/comments");
    final response = await http.get(url);

    log(response.body);
    try {
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> commentList = jsonData["comments"];

        return commentList.map((json) => Comments.fromJson(json)).toList();
      } else {
        throw Exception("Failed to fetch products: ${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }
}
