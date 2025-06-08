import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/core/utils/colors.dart';
import 'package:instagram/core/widgets/icons.dart';
import 'package:instagram/core/widgets/text.dart';
import 'package:instagram/data/model/post.dart';
import 'package:instagram/data/model/users.dart';
import 'package:instagram/data/view/home/bottom_card.dart';
import 'package:instagram/data/view_model/post_provider.dart';

class PostCard extends ConsumerWidget {
  const PostCard({super.key, required this.post, required this.user});

  final User user;
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeProv = ref.watch(likeProvider(post.id));

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PROFILE PIC
          CircleAvatar(
            radius: 20,
            backgroundColor: black,
            backgroundImage:
                NetworkImage('https://picsum.photos/seed/${post.id}/400'),
          ),
          SizedBox(width: 10),

          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // NAME
                    CustomText(
                      text: "${user.firstName} ${user.lastName}",
                      fontWeight: FontWeight.bold,
                    ),

                    // MORE
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.more_vert, size: 20),
                    ),
                  ],
                ),

                // TITLE
                CustomText(
                  text: post.title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),

                // TAGS
                Wrap(
                  children: List.generate(
                    post.tags.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: grey.withAlpha(100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CustomText(text: post.tags[index]),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // BODY
                CustomText(text: post.body),
                SizedBox(height: 10),

                // PICTURE
                Container(
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://picsum.photos/seed/${post.id}/400'),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomCard(
                      image: "assets/icons/eye.svg",
                      text: post.views.toString(),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(likeProvider(post.id)).like();
                      },
                      child: BottomCard(
                        image: likeProv.isLiked == 1
                            ? "assets/icons/like_filled.svg"
                            : "assets/icons/like.svg",
                        text: (post.likes + (likeProv.isLiked == 1 ? 1 : 0))
                            .toString(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref.read(likeProvider(post.id)).dislike();
                      },
                      child: BottomCard(
                        image: likeProv.isLiked == -1
                            ? "assets/icons/dislike_filled.svg"
                            : "assets/icons/dislike.svg",
                        text: (post.dislikes + (likeProv.isLiked == -1 ? 1 : 0))
                            .toString(),
                      ),
                    ),
                    CustomIcons(image: "assets/icons/share.svg"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
