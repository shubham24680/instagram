import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/core/utils/colors.dart';
import 'package:instagram/data/view/details/details.dart';
import 'package:instagram/data/view/home/card.dart';
import 'package:instagram/data/view/home/home_appbar.dart';

import 'package:instagram/data/view_model/post_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);
    final currentPost = ref.watch(postProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: homeAppBar(context),
      body: currentPost.when(
        data: (post) => currentUser.when(
          data: (user) => ListView.builder(
            itemCount: min(post.length, user.length),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => context.push("/details",
                    extra: Details(user: user[index], post: post[index])),
                child: PostCard(post: post[index], user: user[index]),
              );
            },
          ),
          error: (e, _) => Center(child: Text('Error: $e')),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => Center(child: Text('Error: $e')),
        loading: () => Center(child: CircularProgressIndicator(color: black)),
      ),
    );
  }
}
