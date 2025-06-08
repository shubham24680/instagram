class Post {
  final int id;
  final String title;
  final List<dynamic> tags;
  final String body;
  final int likes;
  final int dislikes;
  final int views;

  Post({
    required this.id,
    required this.title,
    required this.tags,
    required this.body,
    required this.likes,
    required this.dislikes,
    required this.views,
  });

  factory Post.fromJson(Map<String, dynamic> jsonPost) {
    return Post(
      id: jsonPost["id"],
      title: jsonPost["title"],
      tags: jsonPost["tags"],
      body: jsonPost["body"],
      likes: jsonPost["reactions"]["likes"],
      dislikes: jsonPost["reactions"]["dislikes"],
      views: jsonPost["views"],
    );
  }
}
