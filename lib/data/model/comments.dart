class Comments {
  final String fullName;
  final String body;

  Comments({required this.fullName, required this.body});

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      fullName: json["user"]["fullName"],
      body: json["body"],
    );
  }
}
