import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/core/services/api.dart';
import 'package:instagram/data/model/comments.dart';
import 'package:instagram/data/model/post.dart';
import 'package:instagram/data/model/users.dart';

Api api = Api();
final userProvider =
    FutureProvider<List<User>>((ref) async => api.fetchUsers());
final postProvider =
    FutureProvider<List<Post>>((ref) async => api.fetchPosts());
final commentProvider =
    FutureProvider<List<Comments>>((ref) async => api.fetchComments());
final likeProvider =
    ChangeNotifierProvider.family<LikeModel, int>((ref, postId) => LikeModel());

class LikeModel extends ChangeNotifier {
  int isLiked;

  LikeModel({this.isLiked = 0});

  void like() {
    isLiked = (isLiked == 1) ? 0 : 1;
    notifyListeners();
  }

  void dislike() {
    isLiked = (isLiked == -1) ? 0 : -1;
    notifyListeners();
  }
}
