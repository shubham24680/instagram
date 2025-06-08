import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/core/utils/colors.dart';
import 'package:instagram/core/widgets/icons.dart';
import 'package:instagram/core/widgets/text.dart';
import 'package:instagram/data/model/post.dart';
import 'package:instagram/data/model/users.dart';
import 'package:instagram/data/view/home/bottom_card.dart';
import 'package:instagram/data/view_model/post_provider.dart';

class Details extends ConsumerWidget {
  const Details({super.key, required this.user, required this.post});

  final User user;
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeProv = ref.watch(likeProvider(post.id));
    final commentProv = ref.watch(commentProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: CustomText(
          text: "POST",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                    mainAxisSize: MainAxisSize.min,
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
                            fit: BoxFit.fitHeight,
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
                              text:
                                  (post.likes + (likeProv.isLiked == 1 ? 1 : 0))
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
                              text: (post.dislikes +
                                      (likeProv.isLiked == -1 ? 1 : 0))
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
            SizedBox(height: 10),

            // COMMMENTS
            CustomText(
              text: "Comments",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

            SizedBox(
              height: 10 * 58,
              child: commentProv.when(
                data: (comment) => ListView.builder(
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: black.withAlpha(50),
                        child: Icon(Icons.person, color: black),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: comment[index].fullName,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(text: comment[index].body),
                        ],
                      ),
                    );
                  },
                ),
                error: (e, _) => Center(child: Text('Error: $e')),
                loading: () =>
                    Center(child: CircularProgressIndicator(color: black)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
